//
//  MangaViewController.swift
//  Demo
//
//  Created by khuc.d.m.nguyen on 8/6/19.
//  Copyright © 2019 khuc.d.m.nguyen. All rights reserved.
//

import UIKit

class MangaViewController: UIViewController {
    @IBOutlet weak var pageCollectionView: UICollectionView!
    @IBOutlet weak var fullCollectionView: UICollectionView!
    
    var chapter: Chapter? {
        didSet {
            pageCollectionView.reloadData()
            fullCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension MangaViewController: UICollectionViewDelegateFlowLayout {
    
}

extension MangaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapter?.pages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == fullCollectionView {
            return UICollectionViewCell()
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
