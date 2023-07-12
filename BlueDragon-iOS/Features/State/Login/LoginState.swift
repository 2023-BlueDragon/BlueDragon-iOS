import Foundation

class LoginState: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
}
