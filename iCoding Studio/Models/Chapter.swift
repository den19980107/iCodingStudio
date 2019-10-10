//
//  Chapter.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/10.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import Foundation

struct Chapter:Decodable,Identifiable {
    let id:String
    let chapterName:String
    let belongUnit:String
    let body:String
    let images:[String]
    let like:Int = 0
    
    private enum CodingKeys : String, CodingKey {
        case id = "_id"
        case chapterName
        case belongUnit
        case body
        case images
        case like
    }
}

