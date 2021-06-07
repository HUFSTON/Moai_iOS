//
//  ProductsListModel.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation

struct ProductsListModel: Codable {
    let distance: Double
    let productNo, userNo, shopNo: Int
    let productName, briefDescription: String
    let regularPrice, discountedPrice: Int
    let expiryDatetime, image: String
    let imageNo, imageSort: Int

    enum CodingKeys: String, CodingKey {
        case distance
        case productNo = "product_no"
        case userNo = "user_no"
        case shopNo = "shop_no"
        case productName = "product_name"
        case briefDescription = "brief_description"
        case regularPrice = "regular_price"
        case discountedPrice = "discounted_price"
        case expiryDatetime = "expiry_datetime"
        case image
        case imageNo = "image_no"
        case imageSort = "image_sort"
    }
}

