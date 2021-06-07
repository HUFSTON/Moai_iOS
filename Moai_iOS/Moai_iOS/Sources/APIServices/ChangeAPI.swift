//
//  ChangeAPI.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation
import Moya

enum ChangeAPI {
    case postChange(chargedValue: String)
    case getChange
}

extension ChangeAPI: TargetType {
    var baseURL: URL {
        guard let url = APIServices.baseURL else {
            fatalError()
        }
        return url

    }
    
    var path: String {
        switch self {
        case .postChange:
            return "/change"
        case .getChange:
            return "/account"
        default:
            print("needed to be added")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postChange:
            return .post
        case .getChange:
            return .get
        default:
            print("needed to be added")
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .postChange(let chargedValue):
            return .requestParameters(parameters: ["charged_value": chargedValue], encoding: JSONEncoding.default)
        case .getChange:
            return .requestPlain
        default:
            print("needed to be added")
        }
    }
    
    var headers: [String : String]? {
        guard let token = UserDefaults.standard.value(forKey: "token") as? String else {
            print("no token")
            return nil
        }
        switch self {
        case .getChange:
            return ["Authorization": token]
        case .postChange:
            return ["Content-Type": "application/json",
                    "Authorization": token]
        }
    }
}
