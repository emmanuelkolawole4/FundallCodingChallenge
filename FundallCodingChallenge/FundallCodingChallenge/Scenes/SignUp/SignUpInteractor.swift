//
//  SignUpInteractor.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 18/02/2021.
//

import Foundation

protocol SignUpBusinessLogic {
   func signUp(with model: SignUpRequest)
}

class SignUpInteractor: SignUpBusinessLogic {
   
   var worker: SignUp?
   var presenter: SignUpPresentationLogic?
   
   
   func signUp(with model: SignUpRequest) {
      worker?.signUp(with: model, success: { [ weak self ] (response) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentResponse(prompt: response)
         print(response, ">>>>")
      }, failure: { [ weak self ] (error) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentError(prompt: error)
      })
   }
   
   
}
