//
//  PageCollectionViewCell.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var url: URL? {
        didSet {
            guard let url = url else {
                imageView.image = nil
                return
            }
//            ImageDownloadManager.shared.downloadImage(url.absoluteString, indexPath: nil) { (image, _, _, error) in
//                guard let image = image else {
//                    print("Error loading image: \(error)")
//                    return
//                }
//                DispatchQueue.main.async(execute: {
//                    self.imageView.image = image
//                })
//            }
//            ImageHelper.shared.loadImage(from: url) { [weak self] (image, error) in
//
//            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        url = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
