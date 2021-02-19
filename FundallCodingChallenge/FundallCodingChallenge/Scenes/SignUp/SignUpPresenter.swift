//
//  SignUpPresenter.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 18/02/2021.
//

import Foundation

protocol SignUpPresentationLogic {
   func presentResponse(prompt: SignUpResponse)
   func presentError(prompt: String)
}

class SignUpPresenter: SignUpPresentationLogic {
   
   var view: SignUpDisplayLogic?
   
   func presentResponse(prompt: SignUpResponse) {
      view?.displayResponse(prompt: prompt)
   }
   
   func presentError(prompt: String) {
      view?.displayError(prompt: prompt)
   }
   
   
}
