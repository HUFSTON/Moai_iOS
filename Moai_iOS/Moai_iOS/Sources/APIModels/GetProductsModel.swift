//
//  GetProductsModel.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation

struct GetProductsModel: Codable {
    let lat, lon: Double
    let count: Int
    let results: [ProductsListModel]
    
}


