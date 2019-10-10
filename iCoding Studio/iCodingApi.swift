//
//  iCodingApi.swift
//  iCoding Studio
//
//  Created by 曾柏翰 on 2019/10/8.
//  Copyright © 2019 曾柏翰. All rights reserved.
//

import Foundation

enum iCodingError:Error {
    case noDataAvaliable
    case canNotProcessData
}

struct iCodingRequest {
    static let baseURL:String = "http://163.18.104.164:8888/api"
    
    class getAllClasses:ObservableObject
    {
        @Published var courses:[ClassInfo] = [ClassInfo]()
        
        private var ApiUri:String = "\(iCodingRequest.baseURL)/getClasses"
        
        func getAllCourses() {
            guard let url = URL(string:ApiUri) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    let courses = try JSONDecoder().decode([ClassInfo].self, from: data!)
                    DispatchQueue.main.async {
                        self.courses = courses
                        print(courses[0].className)
                    }
                } catch {
                    print("Failed To decode: ", error)
                }
            }.resume() // VERY IMPORTANT! As the request won't run
        }
        init() {
            getAllCourses()
        }
    }
    
    class getUnitByClassId:ObservableObject
    {
        @Published var units:[Unit] = [Unit]()
        
        func getUnits(ApiUri:String) {
            guard let url = URL(string:ApiUri) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    let units = try JSONDecoder().decode([Unit].self, from: data!)
                    DispatchQueue.main.async {
                        self.units = units
                    }
                } catch {
                    print("Failed To decode: ", error)
                }
            }.resume() // VERY IMPORTANT! As the request won't run
        }
        init(classId:String) {
            let ApiUri = "\(iCodingRequest.baseURL)/getUnit/\(classId)"
            getUnits(ApiUri: ApiUri)
        }
    }
    
    class getVideoInUnit:ObservableObject{
        @Published var videos:[Video] = [Video]()
        
        func getVideos(ApiUri:String){
            guard let url = URL(string: ApiUri) else {return}
            
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                do {
                    let videos = try JSONDecoder().decode([Video].self,from: data!)
                    DispatchQueue.main.async {
                        print(videos)
                        self.videos = videos
                    }
                } catch {
                    print("Failed To decode: ",error)
                }
            }.resume()
        }
        
        init(unitId:String){
            let ApiUri = "\(iCodingRequest.baseURL)/getVideo/\(unitId)"
            getVideos(ApiUri: ApiUri)
        }
    }
    
    class getChapterInUnit:ObservableObject{
        @Published var chapters = [Chapter]()
        
        func getChapter(ApuUri:String){
            
            guard let url = URL(string: ApuUri) else {return}
            
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                do {
                    let chapters = try JSONDecoder().decode([Chapter].self,from: data!)
                    DispatchQueue.main.async {
                        print("chapters = ",chapters)
                        self.chapters = chapters
                    }
                } catch {
                    print("Failed To decode: ",error)
                }
            }.resume()
            
        }
        
        init(unitId:String){
           let ApiUri = "\(iCodingRequest.baseURL)/getChapter/\(unitId)"
            getChapter(ApuUri: ApiUri)
       }
    }
    
    
    class getTestInUnit:ObservableObject{
        @Published var tests = [Test]()
        
        func getTest(ApuUri:String){
            
            guard let url = URL(string: ApuUri) else {return}
            
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                do {
                    let Tests = try JSONDecoder().decode([Test].self,from: data!)
                    DispatchQueue.main.async {
                        print("Tests = ",Tests)
                        self.tests = Tests
                    }
                } catch {
                    print("Failed To decode: ",error)
                }
            }.resume()
            
        }
        
        init(unitId:String){
           let ApiUri = "\(iCodingRequest.baseURL)/getTest/\(unitId)"
            getTest(ApuUri: ApiUri)
       }
    }
}
