//
//  ApiClient.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation
import Alamofire

class SignUpApiClient {
   enum HttpMethodType: String {
      case get, post, patch, delete, put
   }
   
   func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, url: String, params: [String: String] = [:], success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
      let convertedHttpMethod = httpMethodConversion(httpMethod: requestType)
      AF.request(url, method: convertedHttpMethod, parameters: params, encoding:
                  JSONEncoding.default).responseDecodable(of: DataModel.self) { response in
                     if let error = response.error {
                        failure(error.localizedDescription)
                        return
                     }
                     if let result = response.value {
                        success(result)
                        return
                     }
                  }
   }
   
   // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
   private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
      let requestTypeRawValue = httpMethod.rawValue
      let convertedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
      return convertedHttpMethod
   }
}


class GetUserDataApiClient {
    enum HttpMethodType: String {
        case get, post, patch, delete, put
    }

    func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, headers: HTTPHeaders, url: String, params: [String: String] = [:], success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
        let convertedHttpMethod = httpMethodConversion(httpMethod: requestType)
        AF.request(url, method: convertedHttpMethod, parameters: params, headers: headers).responseDecodable(of: DataModel.self) { response in
                if let error = response.error {
                    failure(error.localizedDescription)
                    return
                }
                if let result = response.value {
                    success(result)
                    return
                }
        }
    }
    
    // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
    private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
        let requestTypeRawValue = httpMethod.rawValue
        let convertedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
        return convertedHttpMethod
    }
}
