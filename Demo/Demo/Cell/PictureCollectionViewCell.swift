//
//  PictureCollectionViewCell.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/5/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    var url: URL? {
        didSet {
            guard let url = url else {
                imageView.image = nil
                return
            }
            ImageHelper.shared.loadImage(from: url) { [weak self] (image, error) in
                guard let image = image else {
                    print("Error loading image: \(error)")
                    return
                }
                DispatchQueue.main.async(execute: {
                    self?.imageView.image = image
                })
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func flipCard() {
        UIView.transition(from: frontView, to: backView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }

    @IBAction func doSomethingTapped(_ sender: Any) {
    }
}
