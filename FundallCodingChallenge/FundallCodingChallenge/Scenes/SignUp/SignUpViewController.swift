//
//  SignUpViewController.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 17/02/2021.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
   
   let scrollView = UIScrollView(frame: .zero)
   let headingText = UILabel()
   let nameStackView = UIStackView()
   let registrationStackView = UIStackView()
   let signUpBtn = UIButton()
   let firstNameTextField = UITextField()
   let lastNameTextField = UITextField()
   let emailTextField = UITextField()
   let phoneNumberTextField = UITextField()
   let passwordTextField = UITextField()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
   
   func setUpViews() {
      view.backgroundColor = .systemBackground
      removeNavBarBorder()
      
      let rightBarButtonItem = UIBarButtonItem(title: NavBarItemStringConstants.benefits, style: .plain, target: nil, action: nil)
      let leftBarButtonItem = UIBarButtonItem(title: NavBarItemStringConstants.cancel, style: .plain, target: nil, action: nil)
      rightBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FoundersGrotesk-Regular", size: 11)], for: .normal)
      leftBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FoundersGrotesk-Regular", size: 11)], for: .normal)
      
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
      
      setUpNavigationItem(rightBarButtonItem, leftBarButtonItem)
      setUpHeadingStackView()
      setUpScrollView()
      setUpRegistrationStackView()
      setUpSignUpButton()
      setUpExistingMemberButton()
      setUpTermsAndConditionText()
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
   
   func setUpHeadingStackView() {
      headingText.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      headingText.text = "Let's get started"
      headingText.textAlignment = .left
      
      let subHeadingText = UILabel()
      subHeadingText.font = UIFont(name: "FoundersGrotesk-Regular", size: 11)
      subHeadingText.text = "Your first step toward a better financial lifestyle starts here."
      subHeadingText.textAlignment = .left
      
      let headingStackView = UIStackView(arrangedSubviews: [ headingText, subHeadingText ])
      view.addSubview(headingStackView)
      headingStackView.axis = .vertical
      headingStackView.distribution = .equalSpacing
      headingStackView.spacing = 10
      headingStackView.snp.makeConstraints { (make) in
         make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(120)
         make.left.equalTo(view).offset(27)
      }
   }
   
   func setUpScrollView() {
      view.addSubview(scrollView)
      scrollView.frame = self.view.bounds
      scrollView.autoresizingMask = .flexibleHeight
      scrollView.contentSize = CGSize(width: view.frame.size.width, height: 600)
      scrollView.showsHorizontalScrollIndicator = false
      scrollView.showsVerticalScrollIndicator = false
      scrollView.bounces = true
   
      
      scrollView.snp.makeConstraints { (make) in
         make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(250)
         make.bottom.equalTo(view)
         make.left.equalTo(view)
         make.right.equalTo(view)
      }
   }
   
   func setUpRegistrationStackView() {
      firstNameTextField.placeholder = "First name"
      firstNameTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
      firstNameTextField.autocapitalizationType = .none
      firstNameTextField.autocapitalizationType = .none
      firstNameTextField.returnKeyType = .continue
      let firstNameLine = UIView()
      firstNameTextField.addSubview(firstNameLine)
      firstNameLine.snp.makeConstraints { (make) in
         make.bottom.equalTo(firstNameTextField).offset(5)
         make.height.equalTo(1)
         make.left.equalTo(firstNameTextField)
         make.right.equalTo(firstNameTextField)
      }
      
      firstNameLine.backgroundColor = UIColor(named: "FundallGreen")
      firstNameTextField.setupLeftImage(imageName: "User")

      lastNameTextField.placeholder = "Last name"
      lastNameTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
      lastNameTextField.autocapitalizationType = .none
      lastNameTextField.autocapitalizationType = .none
      lastNameTextField.returnKeyType = .continue
      let lastNameLine = UIView()
      lastNameTextField.addSubview(lastNameLine)
      lastNameLine.snp.makeConstraints { (make) in
         make.bottom.equalTo(lastNameTextField).offset(5)
         make.height.equalTo(1)
         make.left.equalTo(lastNameTextField)
         make.right.equalTo(lastNameTextField)
      }
      lastNameLine.backgroundColor = UIColor(named: "FundallGreen")
      lastNameTextField.setupLeftImage(imageName: "User")
      
      
      nameStackView.addArrangedSubview(firstNameTextField)
      nameStackView.addArrangedSubview(lastNameTextField)
      nameStackView.axis = .horizontal
      nameStackView.distribution = .fillEqually
      nameStackView.spacing = 25
      
      emailTextField.placeholder = "Email address"
      emailTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
      emailTextField.autocapitalizationType = .none
      emailTextField.autocapitalizationType = .none
      emailTextField.returnKeyType = .continue
      let emailLine = UIView()
      emailTextField.addSubview(emailLine)
      emailLine.snp.makeConstraints { (make) in
         make.bottom.equalTo(emailTextField).offset(5)
         make.height.equalTo(1)
         make.left.equalTo(emailTextField)
         make.right.equalTo(emailTextField)
      }
      emailLine.backgroundColor = UIColor(named: "FundallGreen")
      emailTextField.setupLeftImage(imageName: "Conversation")
      
      phoneNumberTextField.placeholder = "Phone number"
      phoneNumberTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
      phoneNumberTextField.autocapitalizationType = .none
      phoneNumberTextField.autocapitalizationType = .none
      phoneNumberTextField.returnKeyType = .continue
      let phoneLine = UIView()
      phoneNumberTextField.addSubview(phoneLine)
      phoneLine.snp.makeConstraints { (make) in
         make.bottom.equalTo(phoneNumberTextField).offset(5)
         make.height.equalTo(1)
         make.left.equalTo(phoneNumberTextField)
         make.right.equalTo(phoneNumberTextField)
      }
      phoneLine.backgroundColor = UIColor(named: "FundallGreen")
      phoneNumberTextField.setupLeftImage(imageName: "Phone")
      
      passwordTextField.placeholder = "Password"
      passwordTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
      passwordTextField.autocapitalizationType = .none
      passwordTextField.autocapitalizationType = .none
      passwordTextField.returnKeyType = .done
      passwordTextField.isSecureTextEntry = true
      passwordTextField.enablePasswordToggle()
      let passwordLineView = UIView()
      passwordTextField.addSubview(passwordLineView)
      passwordLineView.snp.makeConstraints { (make) in
         make.bottom.equalTo(passwordTextField).offset(5)
         make.height.equalTo(1)
         make.left.equalTo(passwordTextField)
         make.right.equalTo(passwordTextField)
      }
      passwordLineView.backgroundColor = UIColor(named: "FundallGreen")
      passwordTextField.setupLeftImage(imageName: "Key")
      
      let inviteCodeLabel = UILabel()
      inviteCodeLabel.text = "Got an invite code?"
      inviteCodeLabel.textColor = UIColor(named: "FundallGreen")
      inviteCodeLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 11)
      
      registrationStackView.addArrangedSubview(nameStackView)
      registrationStackView.addArrangedSubview(emailTextField)
      registrationStackView.addArrangedSubview(phoneNumberTextField)
      registrationStackView.addArrangedSubview(passwordTextField)
      registrationStackView.addArrangedSubview(inviteCodeLabel)
      scrollView.addSubview(registrationStackView)
      registrationStackView.axis = .vertical
      registrationStackView.distribution = .equalSpacing
      registrationStackView.spacing = 40
      registrationStackView.snp.makeConstraints { (make) in
         make.top.equalTo(scrollView)
         make.left.equalTo(view).offset(27)
         make.right.equalTo(view).offset(-27)
      }
      
      firstNameTextField.delegate = self
      lastNameTextField.delegate = self
      emailTextField.delegate = self
      passwordTextField.delegate = self
      phoneNumberTextField.delegate = self
   }
   
   func setUpSignUpButton() {
      scrollView.addSubview(signUpBtn)
      signUpBtn.layer.cornerRadius = 3
      signUpBtn.backgroundColor = UIColor(named: "FundallGreen")
      signUpBtn.setTitle("signup".uppercased(), for: .normal)
      signUpBtn.setTitleColor(.black, for: .normal)
      signUpBtn.titleLabel?.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
      signUpBtn.addTarget(self, action: #selector(didPressSignUpBtn), for: .touchUpInside)
      signUpBtn.snp.makeConstraints { (make) in
         make.centerX.equalTo(scrollView)
         make.width.equalTo(198)
         make.height.equalTo(32)
         make.top.equalTo(registrationStackView.snp.bottom).offset(32)
      }
   }
   
   func setUpExistingMemberButton() {
      let label = UILabel()
      let button = UILabel()
      scrollView.addSubview(label)
      scrollView.addSubview(button)
      
      label.text = "Already a member?"
      label.font = UIFont(name: "FoundersGrotesk-Light", size: 12)
      
      button.text = "Log In"
      button.font = UIFont(name: "FoundersGrotesk-Medium", size: 12)
      button.isUserInteractionEnabled = true
      
      let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressLogInBtn))
      button.addGestureRecognizer(loginLabelTapGesture)
      
      label.snp.makeConstraints { (make) in
         make.centerX.equalTo(scrollView).offset(-15)
         make.top.equalTo(signUpBtn.snp.bottom).offset(20)
      }
      
      button.snp.makeConstraints { (make) in
         make.centerX.equalTo(scrollView).offset(47)
         make.top.equalTo(signUpBtn.snp.bottom).offset(20)
      }
   }
   
   func setUpTermsAndConditionText() {
      let label = UILabel()
      scrollView.addSubview(label)
      
      let strNumber: NSString = "By clicking on Sign up, you agree to our terms & conditions and privacy policy." as NSString
      let rangeOne = (strNumber).range(of: "terms & conditions")
      let rangeTwo = (strNumber).range(of: "privacy policy.")
      let attribute = NSMutableAttributedString.init(string: strNumber as String)
      
      attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "FundallGreen") , range: rangeOne)
      attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "FundallGreen") , range: rangeTwo)
      label.attributedText = attribute
      label.font = UIFont(name: "FoundersGrotesk-Regular", size: 10)
      
      label.snp.makeConstraints { (make) in
         make.centerX.equalTo(scrollView)
         make.top.equalTo(signUpBtn.snp.bottom).offset(200)
      }
      
   }
   
   
   @objc func dismissKeyboard() {
       view.endEditing(true)
   }
   
   @objc func didPressSignUpBtn() {
      print("sign up btn pressed")
   }
   
   @objc func didPressLogInBtn() {
      print("login btn pressed")
   }
   
}

extension SignUpViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == firstNameTextField {
         lastNameTextField.becomeFirstResponder()
      } else if textField == lastNameTextField {
         emailTextField.becomeFirstResponder()
      } else if textField == emailTextField {
         phoneNumberTextField.becomeFirstResponder()
      } else if textField == phoneNumberTextField {
         passwordTextField.becomeFirstResponder()
      } else if textField == passwordTextField {
         dismissKeyboard()
         didPressSignUpBtn()
      }
      return true
   }
}
