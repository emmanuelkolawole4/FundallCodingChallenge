//
//  LogIn.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

struct GetUserDataResponse: Codable {
   let success: GetUserDataSuccess
}

struct GetUserDataSuccess: Codable {
    let status: String
    let data: DataClass
}

struct DataClass: Codable {
    let id: Int
    let firstName, lastName, avatar, email, totalBalance, income, spent: String

    enum CodingKeys: String, CodingKey {
        case id, firstName = "firstname", lastName = "lastname", avatar, email, totalBalance = "total_balance", income, spent
    }
}
