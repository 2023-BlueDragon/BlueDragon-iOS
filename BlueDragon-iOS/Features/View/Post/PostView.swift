import SwiftUI
import PhotosUI


struct PostView: View {
    
    @ObservedObject var state = PostState()
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var isPickerPresented = false
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        VStack {
            Text("글쓰기")
                .font(.largeTitle)
                .padding()
            Text("제목")
                .padding(.top)
            TextField("제목을 써주세요", text: $state.title4)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .border(Color.gray, width: 1)
            Text("내용")
            TextEditor(text: $state.content)
                .frame(height: 150)
                .border(Color.gray, width: 1)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Text("사진")
            Spacer()
            HStack() {
                Button(action: {
                    
                }) {
                    Text("올리기")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(30)
                }
                
            }
            .padding()
        }
        .padding(.horizontal)
        
    }
}
