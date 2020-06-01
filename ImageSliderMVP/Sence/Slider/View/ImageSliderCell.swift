//
//  ImageSliderCell.swift
//  ImageSliderMVP
//
//  Created by Ateek on 6/1/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import UIKit

class ImageSliderCell: UICollectionViewCell {
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var loadingIndecator:UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

}
extension ImageSliderCell:ImageSliderCellView {
    func showImage(image: String) {
        imageView.addImage(withImage: image, andPlaceHolder: "noImageFound", indecator:loadingIndecator )
    }
    
    
}
