//
//  Test.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/10.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import Foundation

struct Test:Decodable,Identifiable {
    let id:String
    let testName:String
    let belongUnit:String
    let testQutions:String
    let publicTime:String
    let EndpublicTime:String
    let isPublic:Bool
    
    private enum CodingKeys : String, CodingKey {
        case id = "_id"
        case testName
        case belongUnit
        case testQutions
        case publicTime
        case EndpublicTime
        case isPublic
   }
}
