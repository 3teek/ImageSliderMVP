//
//  PresenterImageSlider.swift
//  ImageSliderMVP
//
//  Created by Ateek on 6/1/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import Foundation
protocol ImageSliderCellView {
    func showImage(image:String)
}

class PresenterImageSlider{
    private var recivedImages = [MainImages]()
    private let interactor = PresnterHomeSliders()
    init() {}
    
    func callMore(){
        interactor.getImages()
    }
    func reciveImage(imagesArray:[MainImages]){
        self.recivedImages = imagesArray
    }
    
    func sendCountToCollection()->Int{
        return recivedImages.count
    }
    func configureCell(cell:ImageSliderCell,index:Int){
        cell.showImage(image: recivedImages[index].urls?.regular ?? "" )
       
        if index == sendCountToCollection() - 1 {
            callMore()
        }
    }
   
}
