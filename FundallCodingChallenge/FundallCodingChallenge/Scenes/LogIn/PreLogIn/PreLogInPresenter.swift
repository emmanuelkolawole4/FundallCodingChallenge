//
//  PreLogInPresenter.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

protocol PreLogInPresentationLogic {
   func presentResponse(prompt: GetUserDataResponse)
   func presentError(prompt: String)
}

class PreLogInPresenter: PreLogInPresentationLogic {
   
   var view: PreLogInDisplayLogic?
   
   func presentResponse(prompt: GetUserDataResponse) {
      view?.displayResponse(prompt: prompt)
   }
   
   func presentError(prompt: String) {
      view?.displayError(prompt: prompt)
   }
   
   
}
