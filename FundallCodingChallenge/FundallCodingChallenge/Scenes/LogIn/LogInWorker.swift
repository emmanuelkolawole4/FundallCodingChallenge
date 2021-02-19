//
//  LogInWorker.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

protocol LogIn {
   func logIn(with model: LogInRequest, success: @escaping (LogInResponse) -> Void, failure: @escaping (String) -> Void)
}

class LogInWorker: LogIn {
   
   var networkClient: LogInApiClient?
   
   func logIn(with model: LogInRequest, success: @escaping (LogInResponse) -> Void, failure: @escaping (String) -> Void) {
      networkClient?.execute(requestType: .post, url: "https://campaign.fundall.io/api/v1/login", params: [ "email" : model.email, "password" : model.password]) {(response: LogInResponse) in
         success(response)
     } failure: { (error) in
         failure(error)
     }
   }
   
}
