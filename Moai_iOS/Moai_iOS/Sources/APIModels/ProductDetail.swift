//
//  ProductDetail.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation

struct ProductDetail: Codable {
    let productName, detailDescription: String
    let currentQuantity, expectedQuantity, regularPrice, discountedPrice, returnPrice: Int
    let expiryDatetime: String
    let shopImage: String
    let images: [String]
    let shopNo: Int
    let shopName, roadAddress, detailAddress: String
    let latitude, longitude: Double

        enum CodingKeys: String, CodingKey {
            case productName = "product_name"
            case detailDescription = "detail_description"
            case currentQuantity = "current_quantity"
            case expectedQuantity = "expected_quantity"
            case regularPrice = "regular_price"
            case returnPrice = "return_price"
            case images
            case discountedPrice = "discounted_price"
            case expiryDatetime = "expiry_datetime"
            case shopImage = "shop_image"
            case shopNo = "shop_no"
            case shopName = "shop_name"
            case roadAddress = "road_address"
            case detailAddress = "detail_address"
            case latitude, longitude
        }
}

