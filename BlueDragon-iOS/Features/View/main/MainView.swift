import SwiftUI

struct MainView: View {
    @ObservedObject var state = MainState()
    @State var isfullScreen: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 50, height: 30)
                    .padding()
                
                HStack {
                    TextField("", text: $state.search)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName:"magnifyingglass")
                            .padding()
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 0.5)
                )
                
                Button(action: {
                    
                }) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 35))
                        .padding()
                }
            }
            .padding(.horizontal, 10)
            Spacer()
            Button(action: {
                isfullScreen = true
            }) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 50))
                    .padding(.leading)
            }
            .sheet(isPresented: $isfullScreen) {
                PostView()
            }
        }
    }
}

struct MainView_PreView: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
