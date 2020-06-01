//
//  InteracotorSliders.swift
//  ImageSliderMVP
//
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import Foundation
class InteracotorHomeSliders {
    func getImagesSlider(page:Int,completion:@escaping CompletionHandler<[MainImages]>){
        let header = RequestComponent.sharesInstance.headerComponent([.content,.authorization])
        RequestManager.sharesInstance.request(fromUrl: GET_IMAGES_URL + "?page=\(page)", byMethod: .get, withParameters: nil, andHeaders: header) { (error:String?, code:Int?, result:[MainImages]?) in
            guard let imageResult = result else {
                
                completion("Error",ErrorsCodes.castError.rawValue,nil)
                return
            }
            
            if error != nil {
                completion(error,code,nil)
            }else {
                completion(nil,code,imageResult)
            }
            
        }
        
    }
}
