//
//  HomeSliderCell.swift
//  ImageSliderMVP
//
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import UIKit

class HomeSliderCell: UICollectionViewCell {
    @IBOutlet weak var imageSlider:UIImageView!
    @IBOutlet weak var indecator:UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

extension HomeSliderCell:HomeSliderImagesCellView{
    func showImage(image: String) {
        imageSlider.addImage(withImage: image, andPlaceHolder: "noImagePlaceHolder")
    }
    
    
}
