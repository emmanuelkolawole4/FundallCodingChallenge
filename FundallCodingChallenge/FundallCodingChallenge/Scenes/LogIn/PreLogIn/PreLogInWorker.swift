//
//  PreLogInWorker.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

protocol GetUserData {
   func getUserData(success: @escaping (GetUserDataResponse) -> Void, failure: @escaping (String) -> Void)
}

class PreLogInWorker: GetUserData {
   
   var networkClient: GetUserDataApiClient?
   
//   func getUserData(success: @escaping (GetUserDataResponse) -> Void, failure: @escaping (String) -> Void) {
//      networkClient?.execute(headers: [ "Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRlNWY4ZDNjOTEwYTgxNmQyMzkwYTI3ODEwODMzZThiZDJhM2U2MjNiMGVjNTJjZTIxYjc5YzQwODdmOWRmNWEzMzY5MjEyMzRhYzlkZjAwIn0.eyJhdWQiOiIzIiwianRpIjoiZGU1ZjhkM2M5MTBhODE2ZDIzOTBhMjc4MTA4MzNlOGJkMmEzZTYyM2IwZWM1MmNlMjFiNzljNDA4N2Y5ZGY1YTMzNjkyMTIzNGFjOWRmMDAiLCJpYXQiOjE2MTM3MDQxMTgsIm5iZiI6MTYxMzcwNDExOCwiZXhwIjoxNjQ1MjQwMTE4LCJzdWIiOiIxNTgiLCJzY29wZXMiOltdfQ.iaAd-B6fYB32-U-6L4MPiYTzrK5uZCnN1-GmfbziuP1fm-lRZCtSRJnS4LchqmR4_eVbN8Dzc8ySJt4t9zOqU68FxU29hzwq7TJ221giXCtyR1NO3vX1GR9zc-oVPC2Quuxb78Xn_ewaWtOUZl8AWKMCPaOIf-aPSZJ8E8yl86xDY7qJ0ktSQkc0XieSmOp3RttfHPeEzegrXpw-HlYpz_mEQznKYNgn27sAV5prEhuCC5SGtLebSv4-0tLHCn6XJY9_Fhl1CpIMNdWkMPaObvrf7Ho6x3CmVFzvHvlrnmItiTltX8XOsOa9AlAUbzNH92HkKFU65s9793MYz-JyKk0GTfiwmwY3mCmX5rQkrAGReK05PoX_i0YGcM2ncZW2rjDgu4uHX3iSuK8uXpOlXgRXDrrIx42k_d70d3GE02MEP6HgS6bsD67RIy5RZqs9qFf7r-68HmV3xcTcBD49-2af6GlnQWQqMRT3zqWTSV_hUBNAOAvq79VZKlv3mcIh502jaXAFgBO8mWluTI9-zuX4F5bV7l12NH6IocKH_2bKcqawDzooISOM3LM600ddFFeQA1x_MvIbthnrRqQV31uTE5cwlUtAtIQGSzIq67P__8u2vml6G0UdTV1DXVdz9I7ICi9XamJNNQD17dwUNDUQ-idZM0V6lDq_Cvn48-I"], url: "https://campaign.fundall.io/api/v1/base/profile", success: { (response) in
//         success(response)
//      }, failure: { (error) in
//         failure(error)
//      })
//   }
   
   
   func getUserData(success: @escaping (GetUserDataResponse) -> Void, failure: @escaping (String) -> Void) {
      networkClient?.execute(headers: [ "Authorization" : "Bearer \(UserDefaults.standard.object(forKey: "accessToken") ?? "")"], url: "https://campaign.fundall.io/api/v1/base/profile", success: { (response) in
         success(response)
      }, failure: { (error) in
         failure(error)
      })
   }
   
   
   
   
   
}
