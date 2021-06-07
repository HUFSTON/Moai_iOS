//
//  LoginModel.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/06/07.
//

import Foundation

struct Login: Codable {
    let token: String?
    let isSeller: Bool?

    enum CodingKeys: String, CodingKey {
        case token
        case isSeller = "is_seller"
    }
//    let shopToken: String
}
