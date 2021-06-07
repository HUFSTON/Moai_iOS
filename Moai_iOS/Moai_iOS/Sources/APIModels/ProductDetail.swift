//
//  ProductDetail.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation

struct ProductDetail: Codable {
    let no, userNo, shopNo: Int
    let name, briefDescription, detailDescription: String
    let currentQuantity, expectedQuantity: Int
    let actualQuantity: Int?
    let regularPrice, discountedPrice, returnPrice: Int
    let expiryDatetime, createdDatetime, modifiedDatetime: String
    let removedDatetime: String?
    let enabled: Int

    enum CodingKeys: String, CodingKey {
        case no
        case userNo = "user_no"
        case shopNo = "shop_no"
        case name
        case briefDescription = "brief_description"
        case detailDescription = "detail_description"
        case currentQuantity = "current_quantity"
        case expectedQuantity = "expected_quantity"
        case actualQuantity = "actual_quantity"
        case regularPrice = "regular_price"
        case discountedPrice = "discounted_price"
        case returnPrice = "return_price"
        case expiryDatetime = "expiry_datetime"
        case createdDatetime = "created_datetime"
        case modifiedDatetime = "modified_datetime"
        case removedDatetime = "removed_datetime"
        case enabled
    }

}

