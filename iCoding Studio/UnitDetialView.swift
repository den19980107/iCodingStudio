//
//  UnitDetialView.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/10.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import SwiftUI

struct UnitDetialView: View {
    var unit:Unit
    @State var pickerSelectItem = 0
    @ObservedObject var videosData:iCodingRequest.getVideoInUnit
    @ObservedObject var chapterData:iCodingRequest.getChapterInUnit
    @ObservedObject var testData:iCodingRequest.getTestInUnit
    
    init(unit:Unit){
        self.unit = unit
        self.videosData = iCodingRequest.getVideoInUnit(unitId:unit.id)
        self.chapterData = iCodingRequest.getChapterInUnit(unitId: unit.id)
        self.testData = iCodingRequest.getTestInUnit(unitId: unit.id)
    }
    var body: some View {
        VStack {
            HStack {
                Text(unit.unitName)
                    .font(.title)
                Spacer()
            }.padding(.leading,25)
            Picker(selection: $pickerSelectItem, label: Text("")){
                Text("教材").tag(0)
                Text("影片").tag(1)
                Text("測驗").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal,24)
            
            
            if(self.pickerSelectItem == 0){
                ChapterListView(chapters: chapterData.chapters)
            }
            else if(self.pickerSelectItem == 1){
                VideoListView(videos: videosData.videos)
            }
            else if(self.pickerSelectItem == 2){
                TestListView(tests: testData.tests)
            }
        }.padding(.top,24)

    }
}

struct UnitDetialView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UnitDetialView(unit: Unit())
        }.navigationBarTitle("123", displayMode: .inline)
    }
}

struct VideoItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoItem(video: Video(id: "123", videoName: "123", videoURL: "XZxxvjHqzNE", belongUnit: "12", vtime: "qweqweq", postTime: "123123"))
    }
}

struct VideoItem:View{
    @ObservedObject var imageLoader: ImageLoader
    var video:Video
    init(video:Video)
    {
        self.video = video
        imageLoader = ImageLoader(imageURL:"https://img.youtube.com/vi/\(video.videoURL)/mqdefault.jpg" )
    }
    var body: some View{
        VStack(alignment:.leading){
            Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 345)
            
            Text(video.videoName)
                .font(.title)
            Text(video.postTime)
                .foregroundColor(.secondary)
        }
        
    }
}

struct TestListView: View {
    var tests:[Test]
    var body: some View {
        List(tests){ test in
            Text(test.testName)
        }
    }
}

struct VideoListView: View {
    var videos:[Video]
    var body: some View {
        List(videos){ video in
            VideoItem(video: video)
        }
    }
}

struct ChapterListView: View {
    var chapters:[Chapter]
    var body: some View {
        List(chapters){ chapter in
            Text(chapter.chapterName)
        }
    }
}
