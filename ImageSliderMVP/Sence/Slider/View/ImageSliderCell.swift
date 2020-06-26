//
//  ImageSliderCell.swift
//  ImageSliderMVP
//
//  Created by Ateek on 6/1/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import UIKit

class ImageSliderCell: UICollectionViewCell,UIScrollViewDelegate,UIGestureRecognizerDelegate {
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var zoomIn:UIScrollView!
    var gesture:UITapGestureRecognizer!
    var didTapTwice = Bool()
    override func awakeFromNib() {
        super.awakeFromNib()
        gesture = UITapGestureRecognizer(target: self,  action: #selector(didTap))
        gesture.delegate = self
        gesture.numberOfTapsRequired = 2
        zoomIn.addGestureRecognizer(gesture)
        zoomIn.maximumZoomScale = 5.0
        zoomIn.minimumZoomScale = 1.0
        zoomIn.clipsToBounds = true
        zoomIn.delegate = self
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    @objc func didTap()  {
        UIView.animate(withDuration:0.6) {
            if !self.didTapTwice{
                self.zoomIn.bouncesZoom = true
                self.zoomIn.zoomScale = 4.0
                self.didTapTwice=true
            }else{
                self.zoomIn.zoomScale = 1.0
                self.didTapTwice=false
            }
        }
        
    }
}
extension ImageSliderCell:ImageSliderCellView {
    func showImage(image: String) {
        imageView.addImage(withImage: image, andPlaceHolder: "noImageFound" )
    }
    
    
}
