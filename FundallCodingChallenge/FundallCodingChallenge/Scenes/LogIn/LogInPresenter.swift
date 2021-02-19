//
//  LogInPresenter.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

protocol LogInPresentationLogic {
   func presentResponse(prompt: LogInResponse)
   func presentError(prompt: String)
}

class LogInPresenter: LogInPresentationLogic {
   
   var view: LogInDisplayLogic?
   
   func presentResponse(prompt: LogInResponse) {
      view?.displayResponse(prompt: prompt)
   }
   
   func presentError(prompt: String) {
      view?.displayError(prompt: prompt)
   }
   
}
