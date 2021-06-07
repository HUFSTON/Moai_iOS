//
//  LocationAPI.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation
import Moya

enum LocationAPI {
    case Location
}

extension LocationAPI: TargetType {
    var baseURL: URL {
        guard let url = APIServices.baseURL else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        return "/location"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch  self {
        case .Location:
            return .requestPlain
        default:
            print("needed to be added")
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25vIjo1LCJzaG9wX25vIjo0LCJpYXQiOjE2MjI5NTk2ODIsImV4cCI6MTYyMzA0NjA4MiwiaXNzIjoiTU9BSSJ9.HOz4BdHB13BGnd9DT2hU3Lkp3nYCItKSLgz327ZOqgM"]
    }
    
    
}
