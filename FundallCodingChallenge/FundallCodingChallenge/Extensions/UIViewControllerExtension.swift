//
//  UIViewControllerExtension.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 18/02/2021.
//

import UIKit

extension UIViewController {
   
   func presentAlertForError(with prompt: String) {
      let alert = UIAlertController(title: "⚠️", message: prompt, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
   }
   
   func presentAlertForSuccess(with prompt: String) {
      let alert = UIAlertController(title: "✅", message: prompt, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
   }
   
}
