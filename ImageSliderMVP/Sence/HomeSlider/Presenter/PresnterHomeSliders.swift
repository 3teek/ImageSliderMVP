//
//  HomeSliders.swift
//  ImageSliderMVP
//
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import Foundation
protocol HomeSliderImagesCellView {
    func showImage(image:String)
    
}
protocol PresenterHomeSliderView:class {
    func didLoadImages()
    func showErrors(title:String,message:String)
    func showLoading()
    func hideLoading()
    func moveToImageInfo(images:[MainImages])
}
class PresnterHomeSliders{
    weak var view:PresenterHomeSliderView?
    private let interactor = InteracotorHomeSliders()
    private var images:[MainImages]?
    var nextPage = 1
    init(view:PresenterHomeSliderView) {
        self.view = view
        
    }
    
    // here calling API To Bring Images
    func getImages(){
        view?.showLoading()
        interactor.getImagesSlider(page:nextPage) { (error, code, resultImages) in
            if error != nil {
                self.view?.showErrors(title: "Ops", message: "Sorry Something Wrong Happen Please Try Again ")
                return
            }
            if code == 200 {
                if self.nextPage == 1 {
                    self.images = resultImages
                       self.view?.didLoadImages()
                }else {
                self.images?.append(contentsOf: resultImages!)
                    self.view?.didLoadImages()}
            }
            self.view?.hideLoading()
        }
    }
    
    // Here Passing Count to Table View
    func sendCountToTableView() -> Int {
        return images?.count ?? 0
    }
    
    // here Passing Image Path to Cell 
    func configureSliderCell(cell:HomeSliderCell,index:Int){
        cell.showImage(image: images?[index].urls?.regular ?? "")
        if index == (images?.count)! - 1 {
            self.nextPage += 1
            getImages()
        }
    }
    // here if user Select an image
    func didSelectCell(index:Int){
//        let id =  images?.resultImage[index].imageID ?? 0
        view?.moveToImageInfo(images:images!)
    }
}
