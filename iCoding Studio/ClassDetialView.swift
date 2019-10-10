//
//  ClassDetialView.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/6.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import SwiftUI

struct ClassDetialView: View {
    var course:ClassInfo
    @ObservedObject var result:iCodingRequest.getUnitByClassId
    
    init(course:ClassInfo) {
        self.course = course
        self.result = iCodingRequest.getUnitByClassId(classId: course.id)
    }
    
    var body: some View {
        VStack(alignment:.leading){
            ImageViewWidget(url: course.classImage)
            VStack {
                Text(course.className)
                    .font(.title)
            }
            .padding(10)
            List(result.units) { unit in
                NavigationLink(destination: UnitDetialView(unit: unit)){
                    Text(unit.unitName)
                }
            }

        }
    }
}


private struct ImageViewWidget:View
{
    @ObservedObject var imageLoader: ImageLoader //= ImageLoader(imageURL: self.url)
    init(url:String)
    {
        imageLoader = ImageLoader(imageURL: url)
    }
    var body:some View
    {
        Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 380, alignment: .leading)
    }
}
#if DEBUG
struct SwiftUIView_Previews:PreviewProvider {
    static var previews: some View{
        ClassDetialView(course: ClassInfo())
    }
}
#endif
