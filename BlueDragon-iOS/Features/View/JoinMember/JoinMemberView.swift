import SwiftUI

struct JoinMemberView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var state = JoinMemberState()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image("logo")
                    .resizable()
                    .frame(width: 161.42, height: 80)
                Text("회원 가입")
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("이름")
                        .fontWeight(.bold)
                        .font(.title3)
                    TextField("이름 입력해주세요", text: $state.name)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .overlay() {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.5)
                        }
                }
                
                VStack(alignment: .leading) {
                    Text("이메일")
                        .fontWeight(.bold)
                        .font(.title3)
                        .padding(.top)
                    TextField("이메일 입력해주세요", text: $state.email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .overlay() {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.5)
                        }
                }
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                        .fontWeight(.bold)
                        .font(.title3)
                        .padding(.top)
                    TextField("비밀번호 입력해주세요", text: $state.pw)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .overlay() {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 0.5)
                        }
                }
                
                HStack(spacing: 5) {
                    Text("계정이 있으신가요?")
                    Button(action: {
                        dismiss()
                    }) {
                        Text("로그인")
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("회원 가입")
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
