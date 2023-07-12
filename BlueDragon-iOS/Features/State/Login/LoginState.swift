import Foundation
import Alamofire

class LoginState: ObservableObject {
    
    @Published var id: String = ""
    @Published var passWord: String = ""
    
    func login(completion: @escaping (Bool) -> Void) {
        let query : Parameters = [
            "id" : id,
            "passWord" : passWord
        ]
        
        AF.request("http://15.164.81.241:8080/auth/login",
                   method: .post,
                   parameters: query,
                   encoding: JSONEncoding.default)
        { $0.timeoutInterval = 60 }
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Response: \(value)")
                    completion(true)
                case .failure(let error):
                    print(error)
                    completion(false)
                }
            }
    }
}
