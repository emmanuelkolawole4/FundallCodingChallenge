//
//  LogIn.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

// MARK: - GET USER DATA
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




// MARK: - LOGIN
struct LogInRequest: Codable { let email, password: String }

struct LogInResponse: Codable {
   let success: LogInResponseSuccess
}

struct LogInResponseSuccess: Codable {
   let user: User
   let status: String
}

struct User: Codable {
   let id, monthlyTarget: Int
   let firstName, lastName, email, avatar, createdAt, updatedAt, accessToken, tokenType, expiresAt: String
   
   enum CodingKeys: String, CodingKey {
      case id, firstName = "firstname", lastName = "lastname", email, avatar, monthlyTarget = "monthly_target", createdAt = "created_at", updatedAt = "updated_at", accessToken = "access_token", tokenType = "token_type", expiresAt = "expires_at"
   }
}

