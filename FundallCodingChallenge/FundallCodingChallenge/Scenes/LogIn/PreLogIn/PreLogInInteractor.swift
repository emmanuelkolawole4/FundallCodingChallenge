//
//  PreLogInInteractor.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import Foundation

protocol PreLogInBusinessLogic {
   func getUserData()
}

class PreLogInInteractor: PreLogInBusinessLogic {
   
   var worker: GetUserData?
   var presenter: PreLogInPresentationLogic?

   func getUserData() {
      worker?.getUserData(success: { [ weak self ] (response) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentResponse(prompt: response)
      }, failure: { [ weak self ] (error) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentError(prompt: error)
      })
   }
   
}
