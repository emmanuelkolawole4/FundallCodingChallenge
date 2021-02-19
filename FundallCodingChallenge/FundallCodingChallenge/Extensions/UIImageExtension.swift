//
//  UIImageExtension.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import UIKit

extension UIImage {
   public static func loadImage(from url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
      DispatchQueue.global().async {
         if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
               completion(UIImage(data: data))
            }
         } else {
            DispatchQueue.main.async {
               completion(nil)
            }
         }
      }
   }
}
