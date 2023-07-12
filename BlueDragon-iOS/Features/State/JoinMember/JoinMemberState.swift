import Foundation
import Alamofire

class JoinMemberState: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var pw: String = ""
    
    func join() {
        let query : Parameters = [
                    "name" : name,
                    "email" : email,
                    "passWord" : pw
                ]
        AF.request("http://172.16.1.184:8080/user",
            method: .post,
            parameters: query)
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
