//
//  LogInInteractor.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

protocol LogInBusinessLogic {
   func logIn(with model: LogInRequest)
}

class LogInInteractor: LogInBusinessLogic {
   
   var worker: LogIn?
   var presenter: LogInPresentationLogic?
   
   func logIn(with model: LogInRequest) {
      worker?.logIn(with: model, success: { [ weak self ] (response) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentResponse(prompt: response)
      }, failure: { [ weak self ] (error) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentError(prompt: error)
      })
   }
   
}
