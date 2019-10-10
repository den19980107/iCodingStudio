//
//  Video.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/10.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import Foundation

struct Video:Decodable,Identifiable {
    let id:String
    let videoName:String
    let videoURL:String
    let belongUnit:String
    let vtime:String
    let postTime:String
    
    private enum CodingKeys : String, CodingKey {
        case id = "_id"
        case videoName
        case videoURL
        case belongUnit
        case vtime
        case postTime
    }
}
