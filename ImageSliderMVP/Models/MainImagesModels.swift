//
//  MainImagesModels.swift
//  ImageSliderMVP
//
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import Foundation
struct MainImages:Codable {
     let id: String?
        let description: String?
        let altDescription: String?
        let urls: Urls?
        
        enum CodingKeys: String, CodingKey {
            case id, description
            case altDescription = "alt_description"
            case urls
        }
    }

    struct Urls: Codable {
        let raw: String?
        let full: String?
        let regular: String?
        let small: String?
        let thumb: String?
        
        enum CodingKeys: String, CodingKey {
            case raw, full, regular, small, thumb
        }
    }
