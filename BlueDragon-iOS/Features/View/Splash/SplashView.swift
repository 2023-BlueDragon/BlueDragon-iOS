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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.state.isLoding = true
            }
        }
    }
}

struct SplashView_preView: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
