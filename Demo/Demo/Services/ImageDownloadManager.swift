//
//  ImageDownloadManager.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 10/21/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

protocol DownloadDelegate: class {
    func downloadProgressUpdate(for progress: Float)
}

final class ImageDownloadManager {
    weak var downloadDelegate: DownloadDelegate?
    
    var progress: Float = 0.0 {
        didSet {
            
        }
    }
    
    lazy var imageDownloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "nk.imageDownloadQueue"
        queue.qualityOfService = .userInteractive
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    let imageCache = NSCache<NSString, UIImage>()
    
    static let shared = ImageDownloadManager()
    
    private init() { }
}

// MARK: - Download manager
extension ImageDownloadManager {
    func donwloadImage(photoURLs: [URL], completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) {
        for url in photoURLs {
            let operation = CustomOperation(session: URLSession.shared, downloadTaskURL: url) { (localURL, response, error) in
                print("finished downloading: \(url.absoluteString)")
                completionHandler(localURL, response, error)
            }
            imageDownloadQueue.addOperation(operation)
        }
    }
}

// MARK: - Update progress
extension ImageDownloadManager {
    private func updateProgress() {
        downloadDelegate?.downloadProgressUpdate(for: progress)
    }
}
