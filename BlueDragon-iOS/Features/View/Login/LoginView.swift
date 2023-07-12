import SwiftUI

struct LoginView: View {
    
    @ObservedObject var state = LoginState()
    @State var showModal: Bool = false
    @State private var showAlert = false
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("Logo")
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
                
                SecureField("비밀번호를 적어주세요", text: $state.passWord)
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
                    state.login { success in
                        showAlert = !success
                        isLoggedIn = success
                    }
                }) {
                    Text("로그인")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(30)
                }
                .fullScreenCover(isPresented: $isLoggedIn) {
                    MainView()
                }
            }
            .padding()
            .padding(.horizontal, 20)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("오류"),
                    message: Text("ID나 Password가 틀렸습니다."),
                    dismissButton: .default(Text("확인"))
                )
            }
        }
    }
}


struct LoginView_PreView: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
