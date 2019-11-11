//
//  ViewController.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/5/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    fileprivate let columns: CGFloat = 3
    
    var myArr = [String]() {
        didSet {
            myCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myArr = [
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466821-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466876-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467032-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466780-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466818-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466931-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466881-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466978-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466848-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466925-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467042-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466910-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467052-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467028-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466853-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466821-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466876-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467032-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466780-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466818-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466931-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466881-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466978-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466848-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466925-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467042-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466910-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467052-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467028-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466853-jpeg.jpg",
            "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466821-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466876-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467032-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466780-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466818-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466931-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466881-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466978-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466848-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466925-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467042-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466910-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467052-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-467028-jpeg.jpg", "https://wolverine.raywenderlich.com/books/con/image-from-rawpixel-id-466853-jpeg.jpg"]
        
        configView()
    }
    
    private func configView() {
        myCollectionView.register(UINib(nibName: "PictureCollectionViewCell", bundle: nil),
                                  forCellWithReuseIdentifier: "PictureCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (UIScreen.main.bounds.width - layout.sectionInset.left - layout.sectionInset.right - 2) / columns
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = myCollectionView.cellForItem(at: indexPath) as! PictureCollectionViewCell
        cell.flipCard()
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "PictureCollectionViewCell",
                                                              for: indexPath) as? PictureCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        let item = myArr[indexPath.row]
        if let url = URL(string: item) {
            cell.url = url
        }
        return cell
    }
}
