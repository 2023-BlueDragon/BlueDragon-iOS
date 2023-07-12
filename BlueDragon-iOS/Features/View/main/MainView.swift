import SwiftUI

struct MainView: View {
    @ObservedObject var state = MainState()
    var body: some View {
        VStack() {
            HStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 70, height: 40)
                Spacer()
            }
            
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
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.5)
            )
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

struct MainView_PreView: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
