//
//  HomeViewController.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 18/02/2021.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
   
   let scrollView = UIScrollView(frame: .zero)
   let balanceView = UIView()
   let headingStackView = UIStackView()
   let logOutIcon = UIImageView()
   let headingText = UILabel()
   let profilePicture = UIImageView()
   let horizontalStackView = UIStackView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
   
   func setUpViews() {
      view.backgroundColor = .systemBackground
      removeNavBarBorder()
      
      setUpScrollView()
      setUpBalanceView()
      setUpHeadingStackView()
      setUpBalanceText()
      setUpRevenueHorizontalStackView()
   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      balanceView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 15.0)
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
      scrollView.backgroundColor = .red
      
      
      scrollView.snp.makeConstraints { (make) in
         make.height.equalTo(view).multipliedBy(0.6)
         make.bottom.equalTo(view)
         make.left.equalTo(view)
         make.right.equalTo(view)
      }
   }
   
   func setUpBalanceView() {
      let imageView = UIImageView()
      
      view.addSubview(balanceView)
      balanceView.addSubview(imageView)
      
      balanceView.backgroundColor = UIColor(named: "FundallDeepGreen")
      
      imageView.image = UIImage(named: "BalanceViewImage")
      imageView.contentMode = .topLeft
      
      balanceView.snp.makeConstraints { (make) in
         make.top.equalTo(view)
         make.width.equalTo(view)
         make.height.equalTo(view).multipliedBy(0.4)
      }
      
      imageView.snp.makeConstraints { (make) in
         make.top.equalTo(view)
         make.width.equalTo(view)
      }
   }
   
   func setUpHeadingStackView() {
      logOutIcon.image = UIImage(named: "LogOut")
      logOutIcon.contentMode = .scaleAspectFit
      
      headingText.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      headingText.text = "Fundall e-Wallet"
      headingText.textColor = .white
      
      profilePicture.image = UIImage(systemName: "person.circle")
      profilePicture.tintColor = .white
      profilePicture.snp.makeConstraints { (make) in
         make.width.height.equalTo(70)
      }
      
      headingStackView.addArrangedSubview(logOutIcon)
      headingStackView.addArrangedSubview(headingText)
      headingStackView.addArrangedSubview(profilePicture)
      balanceView.addSubview(headingStackView)
      headingStackView.axis = .horizontal
      headingStackView.distribution = .equalCentering
      headingStackView.spacing = 10
      headingStackView.snp.makeConstraints { (make) in
         make.top.equalTo(balanceView).offset(60)
         make.left.equalTo(balanceView).offset(30)
         make.right.equalTo(balanceView).offset(-30)
      }
      
   }
   
   func setUpBalanceText() {
      let balanceLabel = UILabel()
      balanceView.addSubview(balanceLabel)
      balanceLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 32)
      balanceLabel.text = "₦12,634.37"
      balanceLabel.textColor = .white
      balanceLabel.snp.makeConstraints { (make) in
         make.centerX.equalTo(balanceView)
         make.bottom.equalTo(balanceView).offset(-90)
         make.height.equalTo(40)
      }
   }
   
   func setUpRevenueHorizontalStackView() {
      let logOutIcon = UIImageView()
      logOutIcon.image = UIImage(named: "LogOut")
      logOutIcon.contentMode = .scaleAspectFit
      
      let incomeText = UILabel()
      incomeText.text = "Income"
      incomeText.font = UIFont(name: "FoundersGrotesk-Light", size: 12)
      incomeText.textColor = .white
      
      let incomeBalanceText = UILabel()
      incomeBalanceText.text = "₦12,634.37"
      incomeBalanceText.font = UIFont(name: "FoundersGrotesk-Regular", size: 17)
      incomeBalanceText.textColor = .white
      incomeBalanceText.snp.makeConstraints { (make) in
         make.height.equalTo(40)
      }
      
      
      let spentText = UILabel()
      spentText.text = "Spent"
      spentText.font = UIFont(name: "FoundersGrotesk-Light", size: 12)
      spentText.textColor = .white
      
      let spentBalanceText = UILabel()
      spentBalanceText.text = "₦12,634.37"
      spentBalanceText.font = UIFont(name: "FoundersGrotesk-Regular", size: 17)
      spentBalanceText.textColor = .white
      spentBalanceText.snp.makeConstraints { (make) in
         make.height.equalTo(40)
      }
      
      
      let firstVerticalStackView = UIStackView()
      firstVerticalStackView.addArrangedSubview(incomeText)
      firstVerticalStackView.addArrangedSubview(incomeBalanceText)
      firstVerticalStackView.axis = .vertical
//      firstVerticalStackView.distribution = .equalSpacing
      firstVerticalStackView.spacing = 0
      
      let secondVerticalStackView = UIStackView()
      secondVerticalStackView.addArrangedSubview(spentText)
      secondVerticalStackView.addArrangedSubview(spentBalanceText)
      secondVerticalStackView.axis = .vertical
//      secondVerticalStackView.distribution = .equalSpacing
      secondVerticalStackView.spacing = 0

      horizontalStackView.addArrangedSubview(firstVerticalStackView)
      horizontalStackView.addArrangedSubview(secondVerticalStackView)
      balanceView.addSubview(horizontalStackView)
      horizontalStackView.axis = .horizontal
      horizontalStackView.distribution = .fill
      horizontalStackView.spacing = 10
      horizontalStackView.snp.makeConstraints { (make) in
         make.bottom.equalTo(balanceView).offset(-20)
         make.centerX.equalTo(balanceView)
         make.left.equalTo(balanceView).offset(60)
         make.right.equalTo(balanceView).offset(-60)
      }
      
   }
   
   func setUpTransactionOptions() {
      
   }
   
}
