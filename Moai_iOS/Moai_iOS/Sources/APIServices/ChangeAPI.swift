//
//  ChangeAPI.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation
import Moya

enum ChangeAPI {
    case postChange(userNo: String, chargedValue: String)
}

extension ChangeAPI: TargetType {
    var baseURL: URL {
        var baseURL: URL {
            guard let url = APIServices.baseURL else {
                fatalError()
            }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .postChange:
            return "/change"
        default:
            print("needed to be added")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postChange:
            return .post
        default:
            print("needed to be added")
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .postChange(let userNo, let chargedValue):
            return .requestParameters(parameters: ["user_no": userNo, "charged_value": chargedValue], encoding: JSONEncoding.default)
        default:
            print("needed to be added")
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25vIjo1LCJzaG9wX25vIjo0LCJpYXQiOjE2MjI5NTk2ODIsImV4cCI6MTYyMzA0NjA4MiwiaXNzIjoiTU9BSSJ9.HOz4BdHB13BGnd9DT2hU3Lkp3nYCItKSLgz327ZOqgM"]
    }
    
    
}
