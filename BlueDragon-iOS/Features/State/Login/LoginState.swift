import Foundation
import Alamofire

class LoginState: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        let query : Parameters = [
            "id" : email,
            "passWord" : password
        ]
        
        let request = AF.request("http://15.164.81.241:8080/auth/login",
                                 method: .post,
                                 parameters: query,
                                 encoding: JSONEncoding.default)
        { $0.timeoutInterval = 60 }
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Response: \(value)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
