import Foundation
import Alamofire

class JoinMemberState: ObservableObject {
    
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var pw: String = ""
    
    func join() {
        let query : Parameters = [
            "nickName" : nickname,
            "email" : email,
            "passWord" : pw
        ]
        AF.request("http://15.164.81.241:8080/user",
                   method: .post,
                   parameters: query,
                   encoding: JSONEncoding.default)
        { $0.timeoutInterval = 60 }
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Response: \(value)")
                case .failure(let error):
                    print(error)
                }
            }
    }
}
