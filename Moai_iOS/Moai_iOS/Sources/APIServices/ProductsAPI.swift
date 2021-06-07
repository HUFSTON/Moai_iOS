//
//  ProductAPI.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation
import Moya

enum ProductsAPI {
    case getProducts
    case postProducts
    case putProducts
    case deleteProducts(productNo: Int)
    case getProductsSearch(query: String)
    case getProductsDetail(productNo: Int)
    case postProductsReserve
}

extension ProductsAPI: TargetType {
    
    var baseURL: URL {
        guard let url = APIServices.baseURL else {
            fatalError()
        }
        return url

    }
    
    var path: String {
        switch self {
        case .getProductsSearch:
            return "/products/search"
        case .getProductsDetail:
            return "/products/detail"
        case .postProductsReserve:
            return "/products/reserve"
        default:
            return "/products"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProductsSearch, .getProductsDetail, .getProducts:
            return .get
        case .postProducts, .postProductsReserve:
            return .post
        case .putProducts:
            return .put
        case .deleteProducts:
            return .delete
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        case .getProducts:
            return .requestPlain
            
//        case .postProducts: 이거는 아직 이미지 어떻게 처리하는 지 몰라서 남김
        
//        case .putProducts : 이하동문이요
        
        case .deleteProducts(let productNo):
            return .requestParameters(parameters: ["product_no": productNo], encoding: JSONEncoding.default)
            
        
//        case .postProductsReserve: 귀찮음 지금 안함
            
        
        case .getProductsDetail(let productNo):
            return .requestParameters(parameters: ["product_no": productNo], encoding: URLEncoding.queryString)
        
        case .getProductsSearch(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
        
        
        default:
            return .requestData(Data())

        }
    }
    
    var headers: [String : String]? {
        guard let token = UserDefaults.standard.value(forKey: "token") as? String else {
            print("no token")
            return nil
        }
        switch self {
        case .getProducts, .getProductsSearch, .getProductsDetail:
            return ["Authorization": token]
        default:
            return ["Content-Type": "application/json",
                    "Authorization": token]
        }
       
    }
    
    
}
