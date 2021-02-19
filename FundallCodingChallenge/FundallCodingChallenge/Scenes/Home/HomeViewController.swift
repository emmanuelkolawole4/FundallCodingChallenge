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
   let transactionOptionsStackView = UIStackView()
   let foodCard = UIView()
   let carCard = UIView()
   let allCardsView = UIView()
   let paragraphStyle = NSMutableParagraphStyle()
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      balanceView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 15.0)
   }
   
   func setUpViews() {
      view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
      removeNavBarBorder()
      
      setUpScrollView()
      setUpBalanceView()
      setUpHeadingStackView()
      setUpBalanceText()
      setUpRevenueHorizontalStackView()
      setUpTransactionOptions()
      setUpExpensesCard()
      setUpAllCardsView()
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
      scrollView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
      
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
      logOutIcon.isUserInteractionEnabled = true
      let logOutIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressLogOut))
      logOutIcon.addGestureRecognizer(logOutIconTapGesture)
      
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
      let requestCardImageView = UIImageView()
      requestCardImageView.image = UIImage(named: "RequestCard")
      let tap = UITapGestureRecognizer(target: self, action: #selector(didPressRequestCard))
      requestCardImageView.isUserInteractionEnabled = true
      requestCardImageView.addGestureRecognizer(tap)
      
      let analyticsImageView = UIImageView()
      analyticsImageView.image = UIImage(named: "Analytics")
      
      scrollView.addSubview(transactionOptionsStackView)
      transactionOptionsStackView.addArrangedSubview(requestCardImageView)
      transactionOptionsStackView.addArrangedSubview(analyticsImageView)
      transactionOptionsStackView.axis = .horizontal
      transactionOptionsStackView.distribution = .equalSpacing
      transactionOptionsStackView.spacing = 70
      transactionOptionsStackView.snp.makeConstraints { (make) in
         make.top.equalTo(scrollView).offset(20)
         make.centerX.equalTo(scrollView)
      }
   }
   
   func setUpExpensesCard() {
      foodCard.backgroundColor = .white
      foodCard.layer.cornerRadius = 15
      foodCard.snp.makeConstraints { (make) in
         make.height.equalTo(170)
      }
      
      let lunchView1 = UIView()
      foodCard.addSubview(lunchView1)
      lunchView1.snp.makeConstraints { (make) in
         make.top.equalTo(foodCard)
         make.left.right.equalTo(foodCard)
         make.height.equalTo(foodCard).multipliedBy(0.3)
      }
      
      let burgerImageView = UIImageView()
      lunchView1.addSubview(burgerImageView)
      burgerImageView.image = UIImage(named: "Burger")
      burgerImageView.clipsToBounds = true
      burgerImageView.snp.makeConstraints { (make) in
         make.left.equalTo(lunchView1).offset(18)
         make.centerY.equalTo(lunchView1)
         make.height.width.equalTo(lunchView1.snp.height).multipliedBy(0.4)
      }
      
      let lunchText = UILabel()
      lunchView1.addSubview(lunchText)
      paragraphStyle.lineHeightMultiple = 1.0
      lunchText.attributedText = NSMutableAttributedString(string: "Lunch & Dinner", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      lunchText.textColor = .black
      lunchText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      lunchText.snp.makeConstraints { (make) in
         make.centerY.equalTo(burgerImageView).offset(2)
         make.left.equalTo(burgerImageView.snp.right).offset(11)
      }
      
      let lunchAmountText = UILabel()
      lunchView1.addSubview(lunchAmountText)
      lunchAmountText.attributedText = NSMutableAttributedString(string: "$52/day", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      lunchAmountText.textColor = .black
      lunchAmountText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      lunchAmountText.snp.makeConstraints { (make) in
         make.centerY.equalTo(burgerImageView).offset(2)
         make.right.equalTo(lunchView1).offset(-15)
      }
      
      let lunchView2 = UIView()
      foodCard.addSubview(lunchView2)
      lunchView2.addViewBorderColor()
      lunchView2.snp.makeConstraints { (make) in
         make.bottom.equalTo(foodCard)
         make.left.right.equalTo(foodCard)
         make.height.equalTo(foodCard).multipliedBy(0.3)
      }
      
      let checkImageView = UIImageView()
      lunchView2.addSubview(checkImageView)
      checkImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(named: "FundallDeepGreen") ?? UIColor(), renderingMode: .alwaysOriginal)
      checkImageView.clipsToBounds = true
      checkImageView.snp.makeConstraints { (make) in
         make.left.equalTo(lunchView2).offset(18)
         make.centerY.equalTo(lunchView2)
         make.height.width.equalTo(lunchView2.snp.height).multipliedBy(0.4)
      }
      
      let lunchText2 = UILabel()
      lunchView2.addSubview(lunchText2)
      paragraphStyle.lineHeightMultiple = 1.0
      lunchText2.attributedText = NSMutableAttributedString(string: "Your food spending is still on track", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      lunchText2.textColor = .systemGray
      lunchText2.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      lunchText2.snp.makeConstraints { (make) in
         make.centerY.equalTo(checkImageView).offset(2)
         make.left.equalTo(checkImageView.snp.right).offset(10)
      }
      
      let lunchRangeView1 = UIView()
      foodCard.addSubview(lunchRangeView1)
      lunchRangeView1.backgroundColor = #colorLiteral(red: 0.914205686, green: 0.914205686, blue: 0.914205686, alpha: 1)
      lunchRangeView1.clipsToBounds = true
      lunchRangeView1.layer.cornerRadius = 22
      lunchRangeView1.snp.makeConstraints { (make) in
         make.centerY.equalTo(foodCard).offset(-7)
         make.right.equalTo(foodCard).offset(-15)
         make.left.equalTo(foodCard).offset(15)
         make.height.equalTo(foodCard).multipliedBy(0.25)
      }
      
      let lunchRangeView2 = UIView()
      lunchRangeView1.addSubview(lunchRangeView2)
      lunchRangeView2.backgroundColor = UIColor(named: "FundallDeepGreen")
      lunchRangeView2.layer.cornerRadius = 22
      lunchRangeView2.snp.makeConstraints { (make) in
         make.centerY.equalTo(lunchRangeView1)
         make.left.equalTo(lunchRangeView1)
         make.width.equalTo(lunchRangeView1).multipliedBy(0.5)
         make.height.equalTo(lunchRangeView1)
      }
      
      let rangeTwoText = UILabel()
      lunchRangeView2.addSubview(rangeTwoText)
      rangeTwoText.attributedText = NSMutableAttributedString(string: "$450", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      rangeTwoText.textColor = .white
      rangeTwoText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      rangeTwoText.snp.makeConstraints { (make) in
         make.centerY.equalTo(lunchRangeView2).offset(2)
         make.left.equalTo(lunchRangeView2).offset(18)
      }
      
      let rangeOneText = UILabel()
      lunchRangeView1.addSubview(rangeOneText)
      rangeOneText.attributedText = NSMutableAttributedString(string: "$900", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      rangeOneText.textColor = .systemGray
      rangeOneText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      rangeOneText.snp.makeConstraints { (make) in
         make.centerY.equalTo(lunchRangeView1).offset(2)
         make.right.equalTo(lunchRangeView1).offset(-18)
      }
      
      let lunchViewStroke = UIView()
      foodCard.addSubview(lunchViewStroke)
      lunchViewStroke.backgroundColor = UIColor(named: "FundallDeepGreen")
      lunchViewStroke.snp.makeConstraints { (make) in
         make.centerY.equalTo(lunchRangeView1)
         make.height.equalTo(foodCard).multipliedBy(0.35)
         make.width.equalTo(2)
         make.right.equalTo(rangeOneText.snp.left).offset(-20)
      }

      
      carCard.backgroundColor = .white
      carCard.layer.cornerRadius = 15
      carCard.snp.makeConstraints { (make) in
         make.height.equalTo(170)
      }
      
      let carFuelView1 = UIView()
      carCard.addSubview(carFuelView1)
      carFuelView1.snp.makeConstraints { (make) in
         make.top.equalTo(carCard)
         make.left.right.equalTo(carCard)
         make.height.equalTo(carCard).multipliedBy(0.3)
      }
      
      let houseImageView = UIImageView()
      carFuelView1.addSubview(houseImageView)
      houseImageView.image = UIImage(named: "House")
      houseImageView.clipsToBounds = true
      houseImageView.snp.makeConstraints { (make) in
         make.left.equalTo(carFuelView1).offset(18)
         make.centerY.equalTo(carFuelView1)
         make.height.width.equalTo(carFuelView1.snp.height).multipliedBy(0.4)
      }
      
      let carFuelText = UILabel()
      carFuelView1.addSubview(carFuelText)
      paragraphStyle.lineHeightMultiple = 1.0
      carFuelText.attributedText = NSMutableAttributedString(string: "Car Fuel", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      carFuelText.textColor = .black
      carFuelText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      carFuelText.snp.makeConstraints { (make) in
         make.centerY.equalTo(houseImageView).offset(2)
         make.left.equalTo(houseImageView.snp.right).offset(11)
      }
      
      let carFuelAmountText = UILabel()
      carFuelView1.addSubview(carFuelAmountText)
      carFuelAmountText.attributedText = NSMutableAttributedString(string: "$20/day", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      carFuelAmountText.textColor = .black
      carFuelAmountText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      carFuelAmountText.snp.makeConstraints { (make) in
         make.centerY.equalTo(houseImageView).offset(2)
         make.right.equalTo(carFuelView1).offset(-15)
      }
      
      let carFuelView2 = UIView()
      carCard.addSubview(carFuelView2)
      carFuelView2.addViewBorderColor()
      carFuelView2.snp.makeConstraints { (make) in
         make.bottom.equalTo(carCard)
         make.left.right.equalTo(carCard)
         make.height.equalTo(carCard).multipliedBy(0.3)
      }
      
      let fuelCheckImageView = UIImageView()
      carFuelView2.addSubview(fuelCheckImageView)
      fuelCheckImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(named: "FundallDeepGreen") ?? UIColor(), renderingMode: .alwaysOriginal)
      fuelCheckImageView.clipsToBounds = true
      fuelCheckImageView.snp.makeConstraints { (make) in
         make.left.equalTo(carFuelView2).offset(18)
         make.centerY.equalTo(carFuelView2)
         make.height.width.equalTo(carFuelView2.snp.height).multipliedBy(0.4)
      }
      
      let carFuelText2 = UILabel()
      carFuelView2.addSubview(carFuelText2)
      paragraphStyle.lineHeightMultiple = 1.0
      carFuelText2.attributedText = NSMutableAttributedString(string: "Your food spending is still on track", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      carFuelText2.textColor = .systemGray
      carFuelText2.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      carFuelText2.snp.makeConstraints { (make) in
         make.centerY.equalTo(fuelCheckImageView).offset(2)
         make.left.equalTo(fuelCheckImageView.snp.right).offset(10)
      }
      
      let carFuelRangeView1 = UIView()
      carCard.addSubview(carFuelRangeView1)
      carFuelRangeView1.backgroundColor = #colorLiteral(red: 0.914205686, green: 0.914205686, blue: 0.914205686, alpha: 1)
      carFuelRangeView1.clipsToBounds = true
      carFuelRangeView1.layer.cornerRadius = 22
      carFuelRangeView1.snp.makeConstraints { (make) in
         make.centerY.equalTo(carCard).offset(-7)
         make.right.equalTo(carCard).offset(-15)
         make.left.equalTo(carCard).offset(15)
         make.height.equalTo(carCard).multipliedBy(0.25)
      }
      
      let carFuelRangeView2 = UIView()
      carFuelRangeView1.addSubview(carFuelRangeView2)
      carFuelRangeView2.backgroundColor = UIColor(named: "FundallDeepGreen")
      carFuelRangeView2.layer.cornerRadius = 22
      carFuelRangeView2.snp.makeConstraints { (make) in
         make.centerY.equalTo(carFuelRangeView1)
         make.left.equalTo(carFuelRangeView1)
         make.width.equalTo(carFuelRangeView1).multipliedBy(0.65)
         make.height.equalTo(carFuelRangeView1)
      }
      
      let carRangeTwoText = UILabel()
      carFuelRangeView2.addSubview(carRangeTwoText)
      carRangeTwoText.attributedText = NSMutableAttributedString(string: "$600", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      carRangeTwoText.textColor = .white
      carRangeTwoText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      carRangeTwoText.snp.makeConstraints { (make) in
         make.centerY.equalTo(carFuelRangeView2).offset(2)
         make.left.equalTo(carFuelRangeView2).offset(18)
      }
      
      let carRangeOneText = UILabel()
      carFuelRangeView1.addSubview(carRangeOneText)
      carRangeOneText.attributedText = NSMutableAttributedString(string: "$900", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      carRangeOneText.textColor = .systemGray
      carRangeOneText.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
      carRangeOneText.snp.makeConstraints { (make) in
         make.centerY.equalTo(carFuelRangeView1).offset(2)
         make.right.equalTo(carFuelRangeView1).offset(-18)
      }
      
      let carViewStroke = UIView()
      carCard.addSubview(carViewStroke)
      carViewStroke.backgroundColor = UIColor(named: "FundallDeepGreen")
      carViewStroke.snp.makeConstraints { (make) in
         make.centerY.equalTo(carFuelRangeView1)
         make.height.equalTo(carCard).multipliedBy(0.35)
         make.width.equalTo(2)
         make.right.equalTo(carRangeOneText.snp.left).offset(-20)
      }
      
      let stackView = UIStackView()
      scrollView.addSubview(stackView)
      stackView.addArrangedSubview(foodCard)
      stackView.addArrangedSubview(carCard)
      stackView.axis = .vertical
      stackView.distribution = .equalSpacing
      stackView.spacing = 15
      stackView.snp.makeConstraints { (make) in
         make.top.equalTo(transactionOptionsStackView).offset(80)
         make.left.equalTo(view).offset(30)
         make.right.equalTo(view).offset(-30)
      }
      
   }
   
   func setUpAllCardsView() {
      scrollView.addSubview(allCardsView)
      allCardsView.backgroundColor = .white
      allCardsView.layer.cornerRadius = 15
      allCardsView.snp.makeConstraints { (make) in
         make.top.equalTo(carCard.snp.bottom).offset(50)
         make.left.equalTo(view)
         make.right.equalTo(view)
         make.height.equalTo(view)
         make.bottom.equalTo(scrollView).offset(50)
      }
      
      let line = UIImageView(image: UIImage(named: "AllCardsViewLine"))
      allCardsView.addSubview(line)
      line.snp.makeConstraints { (make) in
         make.top.equalTo(allCardsView).offset(10)
         make.centerX.equalTo(allCardsView)
      }
      
      let cardsText = UILabel()
      allCardsView.addSubview(cardsText)
      cardsText.text = "Cards"
      cardsText.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      cardsText.snp.makeConstraints { (make) in
         make.top.equalTo(allCardsView).offset(40)
         make.left.equalTo(allCardsView).offset(50)
         make.height.equalTo(40)
      }
      
      let dotOne = UIImageView(image: UIImage(named: "Dot"))
      let dotTwo = UIImageView(image: UIImage(named: "Dot"))
      dotOne.contentMode = .scaleAspectFill
      dotTwo.contentMode = .scaleAspectFill
      allCardsView.addSubview(dotOne)
      allCardsView.addSubview(dotTwo)
      
      dotOne.snp.makeConstraints { (make) in
         make.top.equalTo(allCardsView).offset(56)
         make.right.equalTo(allCardsView).offset(-50)
      }
      dotTwo.snp.makeConstraints { (make) in
         make.top.equalTo(allCardsView).offset(56)
         make.right.equalTo(dotOne).offset(-15)
      }
      
      let cardsScrollView = UIScrollView()
      allCardsView.addSubview(cardsScrollView)
      cardsScrollView.frame = self.view.bounds
      cardsScrollView.contentSize = CGSize(width: view.frame.size.width + 475, height: 200)
      cardsScrollView.showsHorizontalScrollIndicator = false
      cardsScrollView.showsVerticalScrollIndicator = false
      cardsScrollView.bounces = true
   
      
      let lifeStyleCard = UIView()
      lifeStyleCard.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
      lifeStyleCard.layer.cornerRadius = 10
      cardsScrollView.addSubview(lifeStyleCard)
      lifeStyleCard.snp.makeConstraints { (make) in
         make.left.equalTo(cardsScrollView).offset(48)
         make.height.equalTo(cardsScrollView)
         make.width.equalTo(240)
      }
      
      let lifeStyleCardText = UILabel()
      lifeStyleCardText.text = "Fundall Lifestyle Card"
      lifeStyleCardText.font = UIFont(name: "FoundersGrotesk-Semibold", size: 9)
      lifeStyleCard.addSubview(lifeStyleCardText)
      lifeStyleCardText.snp.makeConstraints { (make) in
         make.top.equalTo(lifeStyleCard).offset(13)
         make.left.equalTo(lifeStyleCard).offset(11)
      }
      
      let raveDollarCard = UIView()
      raveDollarCard.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
      raveDollarCard.layer.cornerRadius = 10
      cardsScrollView.addSubview(raveDollarCard)
      raveDollarCard.snp.makeConstraints { (make) in
         make.left.equalTo(lifeStyleCard.snp.right).offset(20)
         make.height.equalTo(cardsScrollView)
         make.width.equalTo(240)
      }
      
      let raveDollarCardText = UILabel()
      raveDollarCardText.text = "Rave Dollar Card"
      raveDollarCardText.font = UIFont(name: "FoundersGrotesk-Semibold", size: 9)
      raveDollarCard.addSubview(raveDollarCardText)
      raveDollarCardText.snp.makeConstraints { (make) in
         make.top.equalTo(raveDollarCard).offset(13)
         make.left.equalTo(raveDollarCard).offset(11)
      }
      
      let bitcoinWalletCard = UIView()
      bitcoinWalletCard.backgroundColor =  #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
      bitcoinWalletCard.layer.cornerRadius = 10
      cardsScrollView.addSubview(bitcoinWalletCard)
      bitcoinWalletCard.snp.makeConstraints { (make) in
         make.left.equalTo(raveDollarCard.snp.right).offset(20)
         make.height.equalTo(cardsScrollView)
         make.width.equalTo(240)
      }
      
      let bitcoinWalletCardText = UILabel()
      bitcoinWalletCardText.text = "Bitcoin Wallet Card"
      bitcoinWalletCardText.font = UIFont(name: "FoundersGrotesk-Semibold", size: 9)
      bitcoinWalletCard.addSubview(bitcoinWalletCardText)
      bitcoinWalletCardText.snp.makeConstraints { (make) in
         make.top.equalTo(bitcoinWalletCard).offset(13)
         make.left.equalTo(bitcoinWalletCard).offset(11)
      }
      
      cardsScrollView.snp.makeConstraints { (make) in
         make.top.equalTo(cardsText.snp.bottom).offset(20)
         make.height.equalTo(200)
         make.width.equalTo(allCardsView)
      }
      
      let todayText = UILabel()
      allCardsView.addSubview(todayText)
      todayText.text = "Today"
      todayText.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      todayText.snp.makeConstraints { (make) in
         make.top.equalTo(cardsScrollView.snp.bottom).offset(40)
         make.left.equalTo(allCardsView).offset(50)
         make.height.equalTo(40)
      }
      
      let viewAllText = UILabel()
      allCardsView.addSubview(viewAllText)
      viewAllText.text = "View all"
      viewAllText.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
      viewAllText.textColor = #colorLiteral(red: 0.7647058824, green: 0.7843137255, blue: 0.8470588235, alpha: 1)
      viewAllText.snp.makeConstraints { (make) in
         make.top.equalTo(cardsScrollView.snp.bottom).offset(40)
         make.right.equalTo(allCardsView).offset(-46)
         make.height.equalTo(40)
      }
      
      //MARK: - TRANSACTION ONE
      let transactionOneImage = UIImageView(image: UIImage(named: "Travel"))
      transactionOneImage.contentMode = .scaleAspectFit

      let transactionOneName = UILabel()
      let strOneNumber: NSString = "Tobiloba \nJust now" as NSString
      let rangeOne = (strOneNumber).range(of: "\nJust now")
      let attributeOne = NSMutableAttributedString.init(string: strOneNumber as String)
      
      attributeOne.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.7647058824, green: 0.7843137255, blue: 0.8470588235, alpha: 1), range: rangeOne)
      transactionOneName.attributedText = attributeOne
      transactionOneName.numberOfLines = 0
      transactionOneName.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      let transactionOneAmount = UILabel()
      transactionOneAmount.text = "₦  130"
      transactionOneAmount.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      transactionOneAmount.textColor = #colorLiteral(red: 0.3019607843, green: 0.9098039216, blue: 0.5921568627, alpha: 1)
      
      let transactionOneView = UIStackView(arrangedSubviews: [ transactionOneImage, transactionOneName, transactionOneAmount])
      transactionOneView.axis = .horizontal
      transactionOneView.distribution = .equalSpacing
      transactionOneView.spacing = 10
      
      
      //MARK: - TRANSACTION TWO
      let transactionTwoImage = UIImageView(image: UIImage(named: "Gem"))
      transactionTwoImage.contentMode = .scaleAspectFit

      let transactionTwoName = UILabel()
      let strTwoNumber: NSString = "Grocery \n12:00PM" as NSString
      let rangeTwo = (strTwoNumber).range(of: "\n12:00PM")
      let attributeTwo = NSMutableAttributedString.init(string: strTwoNumber as String)

      attributeTwo.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.7647058824, green: 0.7843137255, blue: 0.8470588235, alpha: 1), range: rangeTwo)
      transactionTwoName.attributedText = attributeTwo
      transactionTwoName.numberOfLines = 0
      transactionTwoName.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)

      let transactionTwoAmount = UILabel()
      transactionTwoAmount.text = "₦  100"
      transactionTwoAmount.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      transactionTwoAmount.textColor = #colorLiteral(red: 1, green: 0.08235294118, blue: 0.4666666667, alpha: 1)

      let transactionTwoView = UIStackView(arrangedSubviews: [ transactionTwoImage, transactionTwoName, transactionTwoAmount])
      allCardsView.addSubview(transactionTwoView)
      transactionTwoView.axis = .horizontal
      transactionTwoView.distribution = .equalSpacing
      transactionTwoView.spacing = 10

      transactionTwoView.snp.makeConstraints { (make) in
         make.top.equalTo(todayText.snp.bottom).offset(25)
         make.left.equalTo(allCardsView).offset(50)
         make.right.equalTo(allCardsView).offset(-46)
      }
      
      
      //MARK: - TRANSACTION THREE
      let transactionThreeImage = UIImageView(image: UIImage(named: "Gift"))
      transactionThreeImage.contentMode = .scaleAspectFit

      let transactionThreeName = UILabel()
      let strThreeNumber: NSString = "Shopping \n8:00AM" as NSString
      let rangeThree = (strThreeNumber).range(of: "\n8:00AM")
      let attributeThree = NSMutableAttributedString.init(string: strThreeNumber as String)

      attributeThree.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.7647058824, green: 0.7843137255, blue: 0.8470588235, alpha: 1), range: rangeThree)
      transactionThreeName.attributedText = attributeThree
      transactionThreeName.numberOfLines = 0
      transactionThreeName.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)

      let transactionThreeAmount = UILabel()
      transactionThreeAmount.text = "₦  35"
      transactionThreeAmount.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      transactionThreeAmount.textColor = #colorLiteral(red: 1, green: 0.08235294118, blue: 0.4666666667, alpha: 1)

      let transactionThreeView = UIStackView(arrangedSubviews: [ transactionThreeImage, transactionThreeName, transactionThreeAmount])
      allCardsView.addSubview(transactionThreeView)
      transactionThreeView.axis = .horizontal
      transactionThreeView.distribution = .equalSpacing
      transactionThreeView.spacing = 10

      transactionThreeView.snp.makeConstraints { (make) in
         make.top.equalTo(todayText.snp.bottom).offset(25)
         make.left.equalTo(allCardsView).offset(50)
         make.right.equalTo(allCardsView).offset(-46)
      }
      
      
      //MARK: - TRANSACTION FOUR
      let transactionFourImage = UIImageView(image: UIImage(named: "Drink"))
      transactionFourImage.contentMode = .scaleAspectFit

      let transactionFourName = UILabel()
      let strFourNumber: NSString = "Alvare \n0:00AM" as NSString
      let rangeFour = (strFourNumber).range(of: "\n8:00AM")
      let attributeFour = NSMutableAttributedString.init(string: strFourNumber as String)

      attributeFour.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.7647058824, green: 0.7843137255, blue: 0.8470588235, alpha: 1), range: rangeFour)
      transactionFourName.attributedText = attributeFour
      transactionFourName.numberOfLines = 0
      transactionFourName.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)

      let transactionFourAmount = UILabel()
      transactionFourAmount.text = "₦  30"
      transactionFourAmount.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      transactionFourAmount.textColor = #colorLiteral(red: 0.3019607843, green: 0.9098039216, blue: 0.5921568627, alpha: 1)

      let transactionFourView = UIStackView(arrangedSubviews: [ transactionFourImage, transactionFourName, transactionFourAmount])
      allCardsView.addSubview(transactionFourView)
      transactionFourView.axis = .horizontal
      transactionFourView.distribution = .equalSpacing
      transactionFourView.spacing = 10

      transactionFourView.snp.makeConstraints { (make) in
         make.top.equalTo(todayText.snp.bottom).offset(25)
         make.left.equalTo(allCardsView).offset(50)
         make.right.equalTo(allCardsView).offset(-46)
      }
      

      // MARK: - ALL TRANSACTIONS
      let transactionsView = UIStackView(arrangedSubviews: [ transactionOneView, transactionTwoView, transactionThreeView, transactionFourView ])
      allCardsView.addSubview(transactionsView)
      transactionsView.axis = .vertical
      transactionsView.distribution = .fillEqually
      transactionsView.spacing = 5
      
      transactionsView.snp.makeConstraints { (make) in
         make.top.equalTo(todayText.snp.bottom).offset(25)
         make.left.equalTo(allCardsView).offset(50)
         make.right.equalTo(allCardsView).offset(-46)
         make.bottom.equalTo(allCardsView).offset(-65)
      }
   }
   
   @objc func didPressRequestCard() {
      let view = UINavigationController(rootViewController: RequestCardsViewController())
      view.modalPresentationStyle = .fullScreen
      present(view, animated: true, completion: nil)
   }
   
   @objc func didPressLogOut() {
      dismiss(animated: true, completion: nil)
   }
   
   
}
