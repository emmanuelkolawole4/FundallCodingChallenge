//
//  LogInViewController.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 17/02/2021.
//

import UIKit
import SnapKit

protocol PreLogInDisplayLogic {
   func displayResponse(prompt: GetUserDataResponse)
   func displayError(prompt: String)
}

class PreLogInViewController: UIViewController, PreLogInDisplayLogic {
   
   func displayResponse(prompt: GetUserDataResponse) {
      usernameLabel.attributedText = NSMutableAttributedString(string: "\(prompt.success.data.firstName)'s".trunc(length: 5), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      notAccountTextLabel.attributedText = NSMutableAttributedString(string: "Not \(prompt.success.data.firstName)?", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
   }
   
   func displayError(prompt: String) {
      print("error", prompt)
   }
   
   
   let usernameLabel = UILabel()
   let notAccountTextLabel = UILabel()
   var username: String?
   var logoView = UIView()
   var paragraphStyle = NSMutableParagraphStyle()
   var createAccountButton = UIButton()
   var switchAccountButton = UIButton()
   var biometricButton = UIButton()
   var passwordButton = UIButton()
   var interactor: PreLogInBusinessLogic?
   
   func setUpDependencies() {
      let interactor = PreLogInInteractor()
      let worker = PreLogInWorker()
      let presenter = PreLogInPresenter()
      let networkClient = GetUserDataApiClient()
      
      interactor.worker = worker
      interactor.presenter = presenter
      
      worker.networkClient = networkClient
      
      presenter.view = self
      
      self.interactor = interactor
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
      setUpDependencies()
      interactor?.getUserData()
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
   
   func setUpViews() {
      view.addBackground()
      removeNavBarBorder()
      setupLogoView()
      setupUsernameField()
      setupBiometricButton()
      setupPasswordButton()
   }
   
   func setupLogoView() {
      view.addSubview(logoView)
      logoView.snp.makeConstraints { (make) in
         make.height.equalTo(view).multipliedBy(0.35)
         make.left.right.equalTo(view)
         make.centerY.equalTo(view).offset(-20)
      }
      let logoImageView = UIImageView()
      logoImageView.image = UIImage(named: "Logo")
      logoView.addSubview(logoImageView)
      logoImageView.contentMode = .scaleAspectFit
      logoImageView.snp.makeConstraints { (make) in
         make.top.equalTo(logoView)
         make.centerX.equalTo(logoView)
         make.height.equalTo(logoView).multipliedBy(0.4)
      }
   }
   
   func setupUsernameField() {
      let view2 = UIView()
      logoView.addSubview(view2)
      view2.snp.makeConstraints { (make) in
         make.height.equalTo(logoView).multipliedBy(0.1)
         make.width.equalTo(170)
         make.centerX.equalTo(logoView)
         make.bottom.equalTo(logoView)
      }
      
      let newUserTextLabel = UILabel()
      view2.addSubview(newUserTextLabel)
      paragraphStyle.lineHeightMultiple = 1.1
      newUserTextLabel.textAlignment = .right
      newUserTextLabel.attributedText = NSMutableAttributedString(string: "New here? ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      newUserTextLabel.textColor = .white
      newUserTextLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
      newUserTextLabel.snp.makeConstraints { (make) in
         make.bottom.equalTo(view2)
         make.left.equalTo(view2)
      }
      view.addSubview(createAccountButton)
      createAccountButton.setTitle("Create Account", for: .normal)
      createAccountButton.addTarget(self, action: #selector(didPressCreateAccount), for: .touchUpInside)
      createAccountButton.setTitleColor(.white, for: .normal)
      createAccountButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Bold", size: 15)
      createAccountButton.contentMode = .scaleAspectFit
      createAccountButton.snp.makeConstraints { (make) in
         make.bottom.equalTo(view2).offset(6)
         make.right.equalTo(view2)
      }
      
      let view3 = UIView()
      logoView.addSubview(view3)
      view3.snp.makeConstraints { (make) in
         make.height.equalTo(logoView).multipliedBy(0.1)
         make.width.equalTo(183)
         make.centerX.equalTo(logoView)
         make.bottom.equalTo(newUserTextLabel.snp.top).offset(-10)
      }
      
      
      view3.addSubview(notAccountTextLabel)
      notAccountTextLabel.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      notAccountTextLabel.textColor = .white
      notAccountTextLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
      notAccountTextLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(view3)
         make.left.equalTo(view3).offset(-15)
      }
      
      view.addSubview(switchAccountButton)
      switchAccountButton.setTitle("Switch Account", for: .normal)
      switchAccountButton.setTitleColor(.white, for: .normal)
      switchAccountButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Bold", size: 15)
      switchAccountButton.contentMode = .scaleAspectFit
      switchAccountButton.snp.makeConstraints { (make) in
         make.centerY.equalTo(view3).offset(1)
         make.right.equalTo(view3)
      }
      let view1 = UIView()
      logoView.addSubview(view1)
      view1.snp.makeConstraints { (make) in
         make.height.equalTo(logoView).multipliedBy(0.3)
         make.width.equalTo(224)
         make.centerX.equalTo(logoView)
         make.bottom.equalTo(notAccountTextLabel.snp.top).offset(-10)
      }
      
      
      view1.addSubview(usernameLabel)
      usernameLabel.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      usernameLabel.textColor = .white
      usernameLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 32)
      usernameLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(view1)
         make.left.equalTo(view1)
      }
      
      let lifeStyleLabel = UILabel()
      view1.addSubview(lifeStyleLabel)
      lifeStyleLabel.attributedText = NSMutableAttributedString(string: "lifestyle", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      lifeStyleLabel.textColor = .white
      lifeStyleLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 32)
      lifeStyleLabel.snp.makeConstraints { (make) in
         make.right.equalTo(view1)
         make.centerY.equalTo(view1)
      }
   }
   
   func setupBiometricButton() {
      let biometricLabel = UILabel()
      view.addSubview(biometricLabel)
      paragraphStyle.lineHeightMultiple = 1.1
      biometricLabel.attributedText = NSMutableAttributedString(string: "Biometrics", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      biometricLabel.textColor = .white
      biometricLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 14)
      biometricLabel.snp.makeConstraints { (make) in
         make.right.equalTo(view).offset(-20)
         make.bottomMargin.equalTo(view).offset(-15)
      }
      
      view.addSubview(biometricButton)
      biometricButton.setImage(UIImage(named: "ThumbPrint"), for: .normal)
      biometricButton.layer.cornerRadius = 26.5
      biometricButton.borderWidth = 1
      biometricButton.borderColor = UIColor(named: "FundallGreen")
      biometricButton.snp.makeConstraints { (make) in
         make.centerX.equalTo(biometricLabel)
         make.height.width.equalTo(53)
         make.bottom.equalTo(biometricLabel.snp.top).offset(-10)
      }
      
   }
   
   func setupPasswordButton() {
      let passwordLabel = UILabel()
      view.addSubview(passwordLabel)
      paragraphStyle.lineHeightMultiple = 1.1
      passwordLabel.attributedText = NSMutableAttributedString(string: "Password", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      passwordLabel.textColor = .white
      passwordLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 14)
      passwordLabel.snp.makeConstraints { (make) in
         make.left.equalTo(view).offset(20)
         make.bottomMargin.equalTo(view).offset(-15)
      }
      
      view.addSubview(passwordButton)
      passwordButton.setImage(UIImage(named: "Key"), for: .normal)
      passwordButton.layer.cornerRadius = 26.5
      passwordButton.borderWidth = 1
      passwordButton.borderColor = UIColor(named: "FundallGreen")
      passwordButton.addTarget(self, action: #selector(didPressLogin), for: .touchUpInside)
      passwordButton.snp.makeConstraints { (make) in
         make.centerX.equalTo(passwordLabel)
         make.height.width.equalTo(53)
         make.bottom.equalTo(passwordLabel.snp.top).offset(-10)
      }
   }
   
   func removeNavBarBorder() {
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
      navigationController?.navigationBar.shadowImage = UIImage()
      navigationController?.navigationBar.layoutIfNeeded()
   }
   
   
   
   @objc func didPressLogin() {
      let view = LogInViewController()
      view.modalPresentationStyle = .fullScreen
      present(view, animated: true, completion: nil)
   }
   
   @objc func didPressCreateAccount() {
      let view = SignUpViewController()
      view.modalPresentationStyle = .fullScreen
      present(view, animated: true, completion: nil)
   }
   
}
