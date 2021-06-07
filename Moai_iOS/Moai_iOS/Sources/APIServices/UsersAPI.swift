//
//  LoginAPI.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import UIKit
import Moya

enum UsersAPI {
    case register(email: String, password: String, name: String, phone: String)
    case login(email: String, password: String)
    case registerSeller
}

extension UsersAPI: TargetType {
    var baseURL: URL {
//        guard let url = URL(string: "http://ec2-3-35-233-132.ap-northeast-2.compute.amazonaws.com:3000") else {
//            fatalError()
//        }
//        guard let url = URL(string: "http://52.78.125.101:3000") else {
//            fatalError()
//        }
//        return url
        guard let url = APIServices.baseURL else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .register:
            return "/users/register"
        case .login:
            return "/users/login"
        case .registerSeller:
            return "/users/register/seller"
        default:
            print("need to be added")
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .register(let email, let password, let name, let phone):
            return .requestParameters(parameters: ["email": email,
                                                   "password": password,
                                                   "name": name,
                                                   "phone": phone], encoding: JSONEncoding.default)
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .registerSeller:
            return .requestPlain
        default:
            print("need to be added")

        }
    }
    
    var headers: [String : String]? {
//        return ["Content-Type": "application/json",
//                "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25vIjo1LCJzaG9wX25vIjo0LCJpYXQiOjE2MjI5NTk2ODIsImV4cCI6MTYyMzA0NjA4MiwiaXNzIjoiTU9BSSJ9.HOz4BdHB13BGnd9DT2hU3Lkp3nYCItKSLgz327ZOqgM"]
        return ["Content-Type": "application/json"]
    }
    
    
}
