//
//  MyTownModel.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/08.
//

import Foundation

struct MyTownModel: Codable {
    let count, shopNo: Int
    let shopName: String
    let shopImage: String?
    let latitude, longitude, distance: Double

    enum CodingKeys: String, CodingKey {
        case count
        case shopNo = "shop_no"
        case shopName = "shop_name"
        case shopImage = "shop_image"
        case latitude, longitude, distance
    }
}
