import SwiftUI

struct SplashView: View {
    
    @ObservedObject var state = SplashState()
    
    var body: some View {
        ZStack {
            if self.state.isLoding {
                LoginView()
            } else {
                ZStack(alignment: .center) {
                    Image("logo")
                        .resizable()
                        .frame(width: 240, height: 123.69)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.state.isLoding = true
            }
        }
    }
}
