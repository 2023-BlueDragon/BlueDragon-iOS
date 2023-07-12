import SwiftUI

struct LoginView: View {
    
    @ObservedObject var state = LoginState()
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 190, height: 92.7)
                    .padding(.bottom)
                
                TextField("이메일 적어주세요", text: $state.id)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.5)
                    )
                    .padding(.bottom)
                
                TextField("비밀번호를 적어주세요", text: $state.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.5)
                    )
                
                HStack(spacing: 5) {
                    Text("아직 계정이 없으신가요?")
                    Button(action: {
                        self.showModal.toggle()
                    }) {
                        Text("회원 가입")
                    }
                    .fullScreenCover(isPresented: $showModal) {
                        JoinMemberView()
                    }
                }
                .padding(.bottom)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("로그인")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct LoginView_PreView: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
