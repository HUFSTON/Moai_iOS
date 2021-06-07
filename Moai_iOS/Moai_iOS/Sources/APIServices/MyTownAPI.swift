//
//  MyTownAPI.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/08.
//

import Foundation
import Moya

enum MyTownAPI {
    case getMyTown
}

extension MyTownAPI: TargetType {
    var baseURL: URL {
        guard let url = APIServices.baseURL else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getMyTown:
            return "/mytown"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyTown:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getMyTown:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        guard let token = UserDefaults.standard.value(forKey: "token") as? String else {
            print("no token")
            return nil
        }
        return ["Authorization": token]
    }
    
    
}
