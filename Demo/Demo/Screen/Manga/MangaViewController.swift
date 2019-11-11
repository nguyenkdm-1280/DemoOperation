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

        configView()
    }

    private func configView() {
        // fullCollectionView
        fullCollectionView.register(UINib(nibName: "PageCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "PageCollectionViewCell")
        fullCollectionView.delegate = self
        fullCollectionView.dataSource = self
        
        // pageCollectionView
        pageCollectionView.register(UINib(nibName: "PageCollectionViewCell", bundle: nil),
                                    forCellWithReuseIdentifier: "PageCollectionViewCell")
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        
        chapter = Chapter.mock()
        var urls = [URL]()
        urls =  chapter!.pages.map { page -> URL in
            return URL(string: page.mangaImageURL)!
        }
        
        print("Nguyen url: \(urls)")
        ImageDownloadManager.shared.donwloadImage(photoURLs: urls) { (url, reponse, error) in
            print("okie la ")
        }
    }
}

extension MangaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == fullCollectionView {
            self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.fullCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == fullCollectionView {
            return CGSize(width: 100, height: 100)
        } else if collectionView == pageCollectionView {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        } else {
            return CGSize.zero
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.isEqual(fullCollectionView), scrollView.isDragging {
//            var offset = pageCollectionView.contentOffset
//            offset.x = fullCollectionView.contentOffset.x
//            pageCollectionView.setContentOffset(offset, animated: true)
//        } else if scrollView.isEqual(pageCollectionView), scrollView.isDragging {
//            var offset = fullCollectionView.contentOffset
//            offset.x = pageCollectionView.contentOffset.x
//            fullCollectionView.setContentOffset(offset, animated: true)
//        }
//    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let chapter = chapter else { return }
        if scrollView.isEqual(pageCollectionView) {
            targetContentOffset.pointee = scrollView.contentOffset
            let pageWidth = Float(self.view.bounds.width)
            let minSpace: Float = 10.0
            var mod: Double = 0
            if(velocity.x > 0.5) { mod = 0.5 } else if(velocity.x < -0.5) { mod = -0.5 }
            var cellToSwipe: Double = Double(Float(scrollView.contentOffset.x) / Float(pageWidth+minSpace)) + Double(0.5) + mod
            if cellToSwipe < 0 {
                cellToSwipe = 0
            } else if cellToSwipe >= Double(chapter.pages.count) {
                cellToSwipe = Double(chapter.pages.count) - Double(1)
            }
            print("Nguyen cellToSwipe: \(cellToSwipe)")
            let indexPath = IndexPath(row: Int(cellToSwipe), section: 0)
            //self.topPageControl.currentPage = Int(cellToSwipe)
            self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.fullCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension MangaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapter?.pages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == fullCollectionView {
            guard let cell = fullCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell",
                                                                    for: indexPath) as? PageCollectionViewCell else {
                                                                        return UICollectionViewCell()
            }
            if let url = URL(string: chapter?.pages[indexPath.row].mangaImageURL ?? "") {
                cell.url = url
                cell.backgroundColor = .red
                cell.numberLabel.text = "\(indexPath.row)"
            }
            return cell
        } else if collectionView == pageCollectionView {
            guard let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell",
                                                                    for: indexPath) as? PageCollectionViewCell else {
                                                                        return UICollectionViewCell()
            }
            if let url = URL(string: chapter?.pages[indexPath.row].mangaImageURL ?? "") {
                cell.url = url
                cell.numberLabel.text = "\(indexPath.row)"
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
