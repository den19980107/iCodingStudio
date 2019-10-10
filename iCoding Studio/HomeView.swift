import SwiftUI

struct CourseRowView:View
{
    var course:ClassInfo
    var body:some View{

        VStack
        {
            HStack{
                ImageViewWidget(url: course.classImage)
                VStack(alignment: .leading){
                    Text(course.className)
                    Spacer()
                    if(course.outline == ""){
                        Text("上課教室：未設定")
                    }else{
                        Text("上課教室：\(course.outline)")
                    }
                }
            }

        }.padding(10)
    }
}




class ImageLoader:ObservableObject
{
    @Published var data:Data = Data()
    func getImage(imageURL:String) {
        guard let url = URL(string: imageURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    self.data = data
                }
            }
        }.resume() // VERY IMPORTANT! As the request won't run
    }
    init(imageURL:String) {
        getImage(imageURL: imageURL)
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
        Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage()).resizable().frame(width: 160, height: 90)
    }
}



struct ContentView: View {
    @ObservedObject var resp = iCodingRequest.getAllClasses()
    
    var body: some View {
        NavigationView{
            List(resp.courses){ course in
                NavigationLink(destination:ClassDetialView(course: course)){
                    CourseRowView(course: course)
                }
            }.navigationBarTitle("所有課程",displayMode:.inline)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

