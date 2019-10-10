//
//  Unit.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/8.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import Foundation
struct Unit :Decodable,Identifiable{
    let id:String
    let unitName:String
    let belongClass:String
    private enum CodingKeys : String, CodingKey {
        case id = "_id"
        case unitName
        case belongClass
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.unitName = try values.decode(String.self, forKey: .unitName)
        self.belongClass = try values.decode(String.self, forKey: .belongClass)
    }
    
    init(){
        self.id = "id001"
        self.unitName = "測試單元"
        self.belongClass = "classid"
    }
}
