//
//  Class.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/6.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import Foundation

final class ClassInfo: Decodable,Identifiable{
    let id: String
    let className: String
    let teacher: String
    let outline,credit,classRoom,classTime: String
    let isLunched: Bool
    var classImage: String

    private enum CodingKeys : String, CodingKey {
        case id = "_id"
        case className
        case teacher
        case outline,credit,classRoom,classTime
        case isLunched
        case classImage
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.className = try values.decode(String.self, forKey: .className)
        self.teacher = try values.decode(String.self, forKey: .teacher)
        self.outline = try values.decode(String.self, forKey: .outline)
        self.credit = try values.decode(String.self, forKey: .credit)
        self.classRoom = try values.decode(String.self, forKey: .classRoom)
        self.classTime = try values.decode(String.self, forKey: .classTime)
        self.isLunched = try values.decode(Bool.self, forKey: .isLunched)
        if(values.contains(.classImage)){
            self.classImage = try values.decode(String.self, forKey: .classImage)
            self.classImage = "http://163.18.104.164:8888/class/image/" + self.classImage
        }else{
            self.classImage = "http://163.18.104.164:8888/img/NoImage.png"
        }
    }
    
    init(){
        self.id = "5d9dcc956c572338619cac7a"
        self.className = "測試課程"
        self.teacher = "teacher"
        self.outline = ""
        self.credit = ""
        self.classRoom = ""
        self.classTime = ""
        self.isLunched = true
        self.classImage = "http://localhost:3000/img/NoImage.png"
    }
}
