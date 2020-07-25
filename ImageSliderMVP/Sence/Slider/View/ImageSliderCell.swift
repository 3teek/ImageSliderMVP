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
    func scrollViewDidZoom(_ scrollView: UIScrollView) {

          if zoomIn.zoomScale > 1 {

              if let image = imageView.image {

                  let ratioW = imageView.frame.width / image.size.width
                  let ratioH = imageView.frame.height / image.size.height

                  let ratio = ratioW < ratioH ? ratioW:ratioH

                  let newWidth = image.size.width*ratio
                  let newHeight = image.size.height*ratio

                  let left = 0.5 * (newWidth * scrollView.zoomScale > imageView.frame.width ? (newWidth - imageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                  let top = 0.5 * (newHeight * scrollView.zoomScale > imageView.frame.height ? (newHeight - imageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))

                  scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
              }
          } else {
              scrollView.contentInset = UIEdgeInsets.zero
          }
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
