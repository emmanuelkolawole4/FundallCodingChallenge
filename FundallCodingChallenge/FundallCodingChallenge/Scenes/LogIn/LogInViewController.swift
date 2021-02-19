//
//  LogInViewController.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 18/02/2021.
//

import UIKit
import SnapKit
import NVActivityIndicatorView

protocol LogInDisplayLogic {
   func displayResponse(prompt: LogInResponse)
   func displayError(prompt: String)
}

class LogInViewController: UIViewController, LogInDisplayLogic {
   
   func displayResponse(prompt: LogInResponse) {
      if prompt.success.status == "SUCCESS" {
         preloader.stopAnimating()
         activityLoader.isHidden = true
         let view = HomeViewController()
         view.modalPresentationStyle = .fullScreen
         present(view, animated: true, completion: nil)
         
         UserDefaults.standard.set(prompt.success.user.accessToken, forKey: "accessToken")
         UserDefaults.standard.set(prompt.success.user.email, forKey: "email")
         UserDefaults.standard.set(prompt.success.user.tokenType, forKey: "tokenType")
         UserDefaults.standard.set(prompt.success.user.firstName, forKey: "firstName")
         
//         print("payload on login vc: ", UserDefaults.standard.object(forKey: "accessToken"), UserDefaults.standard.object(forKey: "email"), UserDefaults.standard.object(forKey: "tokenType"), UserDefaults.standard.object(forKey: "firstName"))
      }
   }
   
   func displayError(prompt: String) {
      print("error", prompt)
      preloader.stopAnimating()
      activityLoader.isHidden = true
      presentAlertForError(with: "Something went wrong. please make sure your login details are correct, and try again.")
   }
   
   
   let scrollView = UIScrollView(frame: .zero)
   let headingText = UILabel()
   let logInBtn = UIButton()
   let emailText = UILabel()
   let passwordTextField = UITextField()
   let profileImageView = UIImageView()
   var interactor: LogInBusinessLogic?
   var activityLoader = UIView()
   var preloader = NVActivityIndicatorView(frame: .zero, type: .circleStrokeSpin, color: .white, padding: .none)
   
   func setUpDependencies() {
      let interactor = LogInInteractor()
      let worker = LogInWorker()
      let presenter = LogInPresenter()
      let networkClient = LogInApiClient()
      
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
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      
      print("payload on login vc: ", UserDefaults.standard.object(forKey: "accessToken"), UserDefaults.standard.object(forKey: "email"), UserDefaults.standard.object(forKey: "tokenType"), UserDefaults.standard.object(forKey: "firstName"))
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      passwordTextField.text = ""
   }
   
   func setUpViews() {
      view.backgroundColor = .systemBackground
      removeNavBarBorder()
      
      let leftBarButtonItem = UIBarButtonItem(title: NavBarItemStringConstants.cancel, style: .plain, target: self, action: #selector(didPressCancel))
      leftBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FoundersGrotesk-Regular", size: 11)], for: .normal)
      
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
      
      setUpNavigationItem(nil, leftBarButtonItem)
      setUpHeadingText()
      setUpScrollView()
      setUpProfileImage()
      setUpAcknowledgementText()
      setUpEmailText()
      setUpPasswordTextField()
      setUpLogInButton()
      setUpNewMemberButton()
      setupPreloader()
   }
   
   func setUpNavigationItem(_ rightItem: UIBarButtonItem?, _ leftItem: UIBarButtonItem?) {
      navigationItem.rightBarButtonItem = rightItem
      navigationItem.leftBarButtonItem = leftItem
   }
   
   func removeNavBarBorder() {
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
      navigationController?.navigationBar.shadowImage = UIImage()
      navigationController?.navigationBar.layoutIfNeeded()
   }
   
   func setUpScrollView() {
      view.addSubview(scrollView)
      scrollView.frame = self.view.bounds
      scrollView.autoresizingMask = .flexibleHeight
      scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
      scrollView.showsHorizontalScrollIndicator = false
      scrollView.showsVerticalScrollIndicator = false
      scrollView.bounces = true
      
      
      scrollView.snp.makeConstraints { (make) in
         make.top.equalTo(view)
         make.bottom.equalTo(view)
         make.left.equalTo(view)
         make.right.equalTo(view)
      }
   }
   
   func setUpHeadingText() {
      headingText.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      if (UserDefaults.standard.object(forKey: "firstName") != nil) {
         headingText.text = "Welcome back!"
      } else {
         headingText.text = "Welcome!"
      }
      headingText.textAlignment = .center
      
      scrollView.addSubview(headingText)
      headingText.snp.makeConstraints { (make) in
         make.top.equalTo(scrollView).offset(90)
         make.centerX.equalTo(scrollView)
      }
   }
   
   func setUpProfileImage() {
      scrollView.addSubview(profileImageView)
      profileImageView.image = UIImage(systemName: "person.circle")
      profileImageView.tintColor = .white
      profileImageView.clipsToBounds = true
      profileImageView.backgroundColor = UIColor(named: "FundallGreen")
      profileImageView.layer.cornerRadius = 72
      profileImageView.snp.makeConstraints { (make) in
         make.height.width.equalTo(144)
         make.centerX.equalTo(view)
         make.top.equalTo(headingText.snp.bottom).offset(50)
      }
   }
   
   func setUpAcknowledgementText() {
      let label = UILabel()
      view.addSubview(label)
      label.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      label.text = "\(UserDefaults.standard.object(forKey: "firstName") ?? "")" //"We miss you, Chimdi"
      label.textAlignment = .center
      label.snp.makeConstraints { (make) in
         make.centerX.equalTo(scrollView)
         make.top.equalTo(profileImageView.snp.bottom).offset(40)
      }
      
   }
   
   func setUpEmailText() {
      view.addSubview(emailText)
      emailText.font = UIFont(name: "FoundersGrotesk-RegularItalic", size: 15)
      emailText.text = "\(UserDefaults.standard.object(forKey: "email") ?? "")" //"chimdiifeoluwa@gmail.com"
      emailText.textAlignment = .center
      emailText.snp.makeConstraints { (make) in
         make.centerX.equalTo(scrollView)
         make.top.equalTo(profileImageView.snp.bottom).offset(80)
      }
      
   }
   
   func setUpPasswordTextField() {
      scrollView.addSubview(passwordTextField)
      passwordTextField.placeholder = "Enter your password"
      passwordTextField.setValue(UIFont(name: "FoundersGrotesk-Light", size: 12.0),forKeyPath: "placeholderLabel.font")
      passwordTextField.autocapitalizationType = .none
      passwordTextField.autocapitalizationType = .none
      passwordTextField.returnKeyType = .done
      passwordTextField.textAlignment = .center
      passwordTextField.isSecureTextEntry = true
      passwordTextField.enablePasswordToggle()
      passwordTextField.snp.makeConstraints { (make) in
         make.left.equalTo(view).offset(45)
         make.right.equalTo(view).offset(-45)
         make.top.equalTo(emailText.snp.bottom).offset(31)
      }
      
      let passwordLineView = UIView()
      passwordTextField.addSubview(passwordLineView)
      passwordLineView.snp.makeConstraints { (make) in
         make.bottom.equalTo(passwordTextField).offset(5)
         make.height.equalTo(1)
         make.left.equalTo(passwordTextField)
         make.right.equalTo(passwordTextField)
      }
      passwordLineView.backgroundColor = UIColor(named: "FundallGreen")
      
      passwordTextField.delegate = self
   }
   
   func setUpLogInButton() {
      scrollView.addSubview(logInBtn)
      logInBtn.layer.cornerRadius = 3
      logInBtn.backgroundColor = UIColor(named: "FundallGreen")
      logInBtn.setTitle("log in".uppercased(), for: .normal)
      logInBtn.setTitleColor(.black, for: .normal)
      logInBtn.titleLabel?.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
      logInBtn.addTarget(self, action: #selector(didPressLogInBtn), for: .touchUpInside)
      logInBtn.snp.makeConstraints { (make) in
         make.left.equalTo(view).offset(18)
         make.right.equalTo(view).offset(-18)
         make.top.equalTo(passwordTextField.snp.bottom).offset(100)
         make.height.equalTo(32)
      }
   }
   
   func setUpNewMemberButton() {
      let label = UILabel()
      let button = UILabel()
      scrollView.addSubview(label)
      scrollView.addSubview(button)
      
      label.text = "New here?"
      label.font = UIFont(name: "FoundersGrotesk-Light", size: 12)
      
      button.text = "Create Account"
      button.font = UIFont(name: "FoundersGrotesk-Medium", size: 12)
      button.isUserInteractionEnabled = true
      
      let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressCreateAccount))
      button.addGestureRecognizer(loginLabelTapGesture)
      
      label.snp.makeConstraints { (make) in
         make.left.equalTo(scrollView).offset(18)
         make.top.equalTo(logInBtn.snp.bottom).offset(38)
      }
      
      button.snp.makeConstraints { (make) in
         make.left.equalTo(scrollView).offset(70)
         make.top.equalTo(logInBtn.snp.bottom).offset(38)
      }
   }
   
   func setupPreloader() {
      activityLoader = UIView()
      view.addSubview(activityLoader)
      activityLoader.backgroundColor = UIColor(named: "FundallGreen")
      activityLoader.layer.cornerRadius = 10
      activityLoader.addSubview(preloader)
      activityLoader.isHidden = true
      preloader.snp.makeConstraints { (make) in
         make.centerX.equalTo(view)
         make.centerY.equalTo(view)
         make.height.width.equalTo(30)
      }
      activityLoader.snp.makeConstraints { (make) in
         make.height.width.equalTo(51)
         make.center.equalTo(view)
      }
   }
   
   
   @objc func didPressCancel() { print("cancel btn pressed") }
   
   @objc func dismissKeyboard() { view.endEditing(true) }
   
   @objc func didPressLogInBtn() {
      let passwordText = passwordTextField.text
      
      if passwordText?.isEmpty == false {
         if let passwordText = passwordText {
            let logInRequest = LogInRequest(email: "\(UserDefaults.standard.object(forKey: "email") ?? "\(UserDefaults.standard.object(forKey: "registerationEmail") ?? "")")", password: passwordText)
            
            interactor?.logIn(with: logInRequest)
            activityLoader.isHidden = false
            preloader.startAnimating()
         }
      } else {
         presentAlertForError(with: "Input field is empty")
      }
   }
   
   @objc func didPressCreateAccount() {
      let view = SignUpViewController()
      view.modalPresentationStyle = .fullScreen
      present(view, animated: true, completion: nil)
   }
   
}

extension LogInViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == passwordTextField {
         dismissKeyboard()
         didPressLogInBtn()
      }
      return true
   }
}



