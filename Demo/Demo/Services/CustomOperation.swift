//
//  CustomOperation.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 10/21/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

struct CustomOperationConstants {
    static let isExecuting = "isExecuting"
    static let isFinished = "isFinished"
}

class CustomOperation: Operation {
    private var task: URLSessionDownloadTask!
    
    enum OperationState: Int {
        case ready
        case executing
        case finished
    }
    
    // Default state is ready when the operation is created
    private var state: OperationState = .ready {
        willSet {
            self.willChangeValue(forKey: CustomOperationConstants.isExecuting)
            self.willChangeValue(forKey: CustomOperationConstants.isFinished)
        }
        
        didSet {
            self.didChangeValue(forKey: CustomOperationConstants.isExecuting)
            self.didChangeValue(forKey: CustomOperationConstants.isFinished)
        }
    }
    
    override var isReady: Bool { return state == .ready }
    override var isExecuting: Bool { return state == .executing }
    override var isFinished: Bool { return state == .finished }
    
    init(session: URLSession, downloadTaskURL: URL, completionHandler: ((URL?, URLResponse?, Error?) -> Void)?) {
        super.init()
        task = session.downloadTask(with: downloadTaskURL, completionHandler: { [weak self] (localURL, response, error) in
            if let completionHandler = completionHandler {
                completionHandler(localURL, response, error)
            }
            self?.state = .finished
        })
    }
    
    override func start() {
        // If the operation or queue get cancalled even before the operation has started, set the operation state to finished and return
        if self.isCancelled {
            state = .finished
            return
        }
        
        state = .executing
        print("Downloading: \(self.task.originalRequest?.url?.absoluteString)")
        
        //Start task downloading
        self.task.resume()
    }
    
    override func cancel() {
        super.cancel()
        self.task.cancel()
    }
    //var downloadHandler: ImageDownloadHandler?
    
//    var imageURL: URL!
//    private var indexPath: IndexPath?
//
//    override var isAsynchronous: Bool {
//        get {
//            return true
//        }
//    }
//
//    private var _executing = false {
//        willSet {
//            willChangeValue(forKey: CustomOperationConstants.isExecuting)
//        }
//        didSet {
//            didChangeValue(forKey: CustomOperationConstants.isExecuting)
//        }
//    }
//
//    private var _finished = false {
//        willSet {
//            willChangeValue(forKey: CustomOperationConstants.isFinished)
//        }
//        didSet {
//            didChangeValue(forKey: CustomOperationConstants.isFinished)
//        }
//    }
//
//    override var isExecuting: Bool {
//        return _executing
//    }
//
//    override var isFinished: Bool {
//        return _finished
//    }
//
//    func executing(_ executing: Bool) {
//        _executing = executing
//    }
//
//    func finish(_ finished: Bool) {
//        _finished = finished
//    }
//
//    required init(url: URL, indexPath: IndexPath?) {
//        self.imageURL = url
//        self.indexPath = indexPath
//    }
//
//    override func main() {
//        guard isCancelled == false else {
//            finish(true)
//            return
//        }
//        self.executing(true)
//        // Callback Asynchrous logic
//        downloadImageFromUrl()
//    }
//
//    func downloadImageFromUrl() {
//        let newSession = URLSession.shared
//        let downloadTask = newSession.downloadTask(with: self.imageURL) { (myUrl, response, error) in
//            if let myUrl = myUrl, let data = try? Data(contentsOf: myUrl) {
//                let image = UIImage(data: data)
//                self.downloadHandler?(image, self.imageURL, nil, error)
//            } else {
//                self.downloadHandler?(nil, self.imageURL, nil, error)
//            }
//
//            self.finish(true)
//            self.executing(false)
//        }
//        downloadTask.resume()
//    }
    
}
