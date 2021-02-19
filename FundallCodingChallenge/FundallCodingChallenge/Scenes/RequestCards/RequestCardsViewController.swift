//
//  RequestCardsViewController.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 19/02/2021.
//

import UIKit
import SnapKit

class RequestCardsViewController: UIViewController {
   
   var cardsView = UIView()
   var foodCard = UIView()
   var fuelCard = UIView()
   var cardScrollView = UIScrollView()
   var cardTitle = UILabel()
   var transactionView = UIView()
   var transactionView2 = UIView()
   var transactionView3 = UIView()
   var transactionView4 = UIView()
   var dayLabel = UILabel()
   var stackView = UIStackView()
   var paragraphStyle = NSMutableParagraphStyle()
   var continueButton = UIButton()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      removeNavBarBorder()
      
      let leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didPressBack))
      leftBarButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font : UIFont(name: "FoundersGrotesk-Regular", size: 11) ], for: .normal)
      navigationItem.leftBarButtonItem = leftBarButtonItem
      
      setupCardsView()
      setupCardScrollView()
      setupDayLAbel()
      setupTransactionView()
      setupSecondTransactionView()
      setupThirdTransactionView()
      setupforthTransactionView()
      setupStackView()
      setUpContinueButton()
   }
   
   func removeNavBarBorder() {
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationController?.navigationBar.shadowImage = UIImage()
      navigationController?.navigationBar.layoutIfNeeded()
   }
   
   func setupCardsView() {
      view.addSubview(cardsView)
      cardsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
      cardsView.backgroundColor = .white
      cardsView.layer.cornerRadius = 20
      cardsView.clipsToBounds = true
      cardsView.snp.makeConstraints { (make) in
         make.top.equalTo(view.snp.top)
         make.left.equalTo(view)
         make.right.equalTo(view)
         make.bottom.equalTo(view)
      }
      
      cardsView.addSubview(cardTitle)
      paragraphStyle.lineHeightMultiple = 1.1
      cardTitle.attributedText = NSMutableAttributedString(string: " Your New Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      cardTitle.textColor = .black
      cardTitle.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      cardTitle.snp.makeConstraints { (make) in
         make.top.equalTo(cardsView).offset(60)
         make.centerX.equalTo(cardsView)
         make.height.equalTo(cardsView.snp.height).multipliedBy(0.05)
      }
      
      let elipses = UILabel()
      cardsView.addSubview(elipses)
      elipses.attributedText = NSMutableAttributedString(string: "• •", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      elipses.textColor = .black
      elipses.font = UIFont(name: "FoundersGrotesk-Medium", size: 20)
      elipses.snp.makeConstraints { (make) in
         make.top.equalTo(cardsView).offset(50)
         make.right.equalTo(cardsView).offset(-15)
      }
   }
   
   func setupCardScrollView() {
      cardsView.addSubview(cardScrollView)
      cardScrollView.frame = cardScrollView.bounds
      cardScrollView.showsHorizontalScrollIndicator = false
      cardScrollView.autoresizingMask = .flexibleWidth
      cardScrollView.contentSize = CGSize(width: cardsView.frame.width + 800, height: 100)
      cardScrollView.bounces = true
      cardScrollView.contentOffset = CGPoint(x:0, y:100)
      cardScrollView.snp.makeConstraints { (make) in
         make.top.equalTo(cardTitle.snp.bottom).offset(0)
         make.width.equalTo(cardsView)
         make.height.equalTo(cardsView).multipliedBy(0.35)
      }
      
      let card1 = UIControl()
      cardScrollView.addSubview(card1)
      card1.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
      card1.clipsToBounds = true
      card1.layer.cornerRadius = 12
      card1.snp.makeConstraints { (make) in
         make.centerY.equalTo(cardScrollView)
         make.left.equalTo(cardScrollView).offset(15)
         make.width.equalTo(view).multipliedBy(0.5)
         make.height.equalTo(cardsView).multipliedBy(0.3)
      }
      
      let card1Text = UILabel()
      card1.addSubview(card1Text)
      card1Text.attributedText = NSMutableAttributedString(string: "Fundall Lifestyle Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      card1Text.textColor = .black
      card1Text.font = UIFont(name: "FoundersGrotesk-Medium", size: 10)
      card1Text.snp.makeConstraints { (make) in
         make.top.equalTo(card1).offset(15)
         make.left.equalTo(card1).offset(11)
      }
      
      let card2 = UIControl()
      cardScrollView.addSubview(card2)
      card2.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
      card2.clipsToBounds = true
      card2.layer.cornerRadius = 12
      card2.snp.makeConstraints { (make) in
         make.centerY.equalTo(cardScrollView)
         make.left.equalTo(card1.snp.right).offset(15)
         make.width.equalTo(view).multipliedBy(0.5)
         make.height.equalTo(cardsView).multipliedBy(0.3)
      }
      
      let card2Text = UILabel()
      card2.addSubview(card2Text)
      card2Text.attributedText = NSMutableAttributedString(string: "Fundall Lifestyle Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      card2Text.textColor = .black
      card2Text.font = UIFont(name: "FoundersGrotesk-Medium", size: 10)
      card2Text.snp.makeConstraints { (make) in
         make.top.equalTo(card2).offset(15)
         make.left.equalTo(card2).offset(11)
      }
      
      let card3 = UIControl()
      cardScrollView.addSubview(card3)
      card3.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
      card3.clipsToBounds = true
      card3.layer.cornerRadius = 12
      card3.snp.makeConstraints { (make) in
         make.centerY.equalTo(cardScrollView)
         make.left.equalTo(card2.snp.right).offset(15)
         make.width.equalTo(view).multipliedBy(0.5)
         make.height.equalTo(cardsView).multipliedBy(0.3)
      }
      
      let card3Text = UILabel()
      card3.addSubview(card3Text)
      card3Text.attributedText = NSMutableAttributedString(string: "Fundall Lifestyle Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      card3Text.textColor = .black
      card3Text.font = UIFont(name: "FoundersGrotesk-Medium", size: 10)
      card3Text.snp.makeConstraints { (make) in
         make.top.equalTo(card3).offset(15)
         make.left.equalTo(card3).offset(11)
      }
   }
   
   func setupDayLAbel() {
      dayLabel = UILabel()
      cardsView.addSubview(dayLabel)
      dayLabel.text = "Pick A Card"
      dayLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
      dayLabel.textColor = .black
      dayLabel.snp.makeConstraints { (make) in
         make.top.equalTo(cardScrollView.snp.bottom).offset(10)
         make.left.equalTo(cardsView.snp.left).offset(20)
         make.width.equalTo(cardsView.snp.width).multipliedBy(0.5)
         make.height.equalTo(cardsView.snp.height).multipliedBy(0.1)
      }
      
      let firstLineView = UIView()
      firstLineView.backgroundColor = .lightGray
      cardsView.addSubview(firstLineView)
      firstLineView.layer.zPosition = 1
      firstLineView.snp.makeConstraints { (make) in
         make.top.equalTo(dayLabel.snp.bottom).offset(-25)
         make.height.equalTo(0.5)
         make.width.equalTo(cardsView.snp.width)
      }
      
   }
   
   func setupTransactionView() {
      transactionView = UIView()
      transactionView.backgroundColor = .red
      
      let imageView = UIImageView()
      transactionView.addSubview(imageView)
      transactionView.backgroundColor = .white
      imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 15
      imageView.contentMode = .center
      imageView.image = UIImage(named: "plane")
      imageView.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView)
         make.height.width.equalTo(transactionView.snp.height).multipliedBy(0.8)
         make.left.equalTo(transactionView.snp.left).offset(20)
      }
      
      let nameLabel = UILabel()
      transactionView.addSubview(nameLabel)
      nameLabel.text = "Tobiola"
      nameLabel.textColor =  .black
      nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      nameLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView).offset(-8)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView.snp.height).multipliedBy(0.4)
      }
      
      let timeLabel = UILabel()
      transactionView.addSubview(timeLabel)
      timeLabel.text = "Just now"
      timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
      timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
      timeLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView).offset(10)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView.snp.height).multipliedBy(0.3)
      }
      
      let priceLabel = UILabel()
      transactionView.addSubview(priceLabel)
      priceLabel.text = "₦130"
      priceLabel.textColor =  .green
      priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
      priceLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(nameLabel)
         make.right.equalTo(transactionView.snp.right).offset(-40)
         make.width.equalTo(transactionView.snp.width).multipliedBy(0.15)
         make.height.equalTo(transactionView.snp.height).multipliedBy(0.4)
      }
      let firstLineView = UIView()
      firstLineView.backgroundColor = .lightGray
      transactionView.addSubview(firstLineView)
      firstLineView.layer.zPosition = 1
      firstLineView.snp.makeConstraints { (make) in
         make.bottom.equalTo(transactionView.snp.bottom).offset(0)
         make.height.equalTo(0.5)
         make.width.equalTo(transactionView.snp.width)
      }
   }
   
   func setupSecondTransactionView() {
      transactionView2 = UIView()
      transactionView2.backgroundColor = .red
      
      let imageView = UIImageView()
      transactionView2.addSubview(imageView)
      transactionView2.backgroundColor = .white
      imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 15
      imageView.contentMode = .center
      imageView.image = UIImage(named: "gem")
      imageView.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView2)
         make.height.width.equalTo(transactionView2.snp.height).multipliedBy(0.8)
         make.left.equalTo(transactionView2.snp.left).offset(20)
      }
      
      let nameLabel = UILabel()
      transactionView2.addSubview(nameLabel)
      nameLabel.text = "Grocery"
      nameLabel.textColor =  .black
      nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      nameLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView2).offset(-8)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView2.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView2.snp.height).multipliedBy(0.4)
      }
      
      let timeLabel = UILabel()
      transactionView2.addSubview(timeLabel)
      timeLabel.text = "12:00PM"
      timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
      timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
      timeLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView2).offset(10)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView2.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView2.snp.height).multipliedBy(0.3)
      }
      
      let priceLabel = UILabel()
      transactionView2.addSubview(priceLabel)
      priceLabel.text = "₦100"
      priceLabel.textColor =  UIColor(red: 1, green: 0.082, blue: 0.467, alpha: 1)
      priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
      priceLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(nameLabel)
         make.right.equalTo(transactionView2.snp.right).offset(-40)
         make.width.equalTo(transactionView2.snp.width).multipliedBy(0.15)
         make.height.equalTo(transactionView2.snp.height).multipliedBy(0.4)
      }
      let firstLineView = UIView()
      firstLineView.backgroundColor = .lightGray
      transactionView2.addSubview(firstLineView)
      firstLineView.layer.zPosition = 1
      firstLineView.snp.makeConstraints { (make) in
         make.bottom.equalTo(transactionView2.snp.bottom).offset(0)
         make.height.equalTo(0.5)
         make.width.equalTo(transactionView2.snp.width)
      }
      
   }
   
   func setupThirdTransactionView() {
      transactionView3 = UIView()
      transactionView3.backgroundColor = .red
      
      let imageView = UIImageView()
      transactionView3.addSubview(imageView)
      transactionView3.backgroundColor = .white
      imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 15
      imageView.contentMode = .center
      imageView.image = UIImage(named: "gift")
      imageView.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView3)
         make.height.width.equalTo(transactionView3.snp.height).multipliedBy(0.8)
         make.left.equalTo(transactionView3.snp.left).offset(20)
      }
      
      let nameLabel = UILabel()
      transactionView3.addSubview(nameLabel)
      nameLabel.text = "Shopping"
      nameLabel.textColor =  .black
      nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      nameLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView3).offset(-8)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView3.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView3.snp.height).multipliedBy(0.4)
      }
      
      let timeLabel = UILabel()
      transactionView3.addSubview(timeLabel)
      timeLabel.text = "8:00AM"
      timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
      timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
      timeLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView3).offset(10)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView3.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView3.snp.height).multipliedBy(0.3)
      }
      
      let priceLabel = UILabel()
      transactionView3.addSubview(priceLabel)
      priceLabel.text = "₦35"
      priceLabel.textColor = UIColor(red: 1, green: 0.082, blue: 0.467, alpha: 1)
      priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
      priceLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(nameLabel)
         make.right.equalTo(transactionView3.snp.right).offset(-40)
         make.width.equalTo(transactionView3.snp.width).multipliedBy(0.15)
         make.height.equalTo(transactionView3.snp.height).multipliedBy(0.4)
      }
      
   }
   
   func setupforthTransactionView() {
      transactionView4 = UIView()
      transactionView4.backgroundColor = .red
      
      let imageView = UIImageView()
      transactionView4.addSubview(imageView)
      transactionView4.backgroundColor = .white
      imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 15
      imageView.backgroundColor = UIColor(red: 0.118, green: 0.949, blue: 1, alpha: 1)
      imageView.contentMode = .center
      imageView.image = UIImage(named: "plne")
      imageView.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView4)
         make.height.width.equalTo(transactionView4.snp.height).multipliedBy(0.8)
         make.left.equalTo(transactionView4.snp.left).offset(20)
      }
      
      let nameLabel = UILabel()
      transactionView4.addSubview(nameLabel)
      nameLabel.text = "Alvare"
      nameLabel.textColor =  .black
      nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
      nameLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView4).offset(10)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView4.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView4.snp.height).multipliedBy(0.4)
      }
      
      let timeLabel = UILabel()
      transactionView4.addSubview(timeLabel)
      timeLabel.text = "0:00AM"
      timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
      timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
      timeLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(transactionView4).offset(10)
         make.left.equalTo(imageView.snp.right).offset(20)
         make.width.equalTo(transactionView4.snp.width).multipliedBy(0.3)
         make.height.equalTo(transactionView4.snp.height).multipliedBy(0.3)
      }
      
      let priceLabel = UILabel()
      transactionView4.addSubview(priceLabel)
      priceLabel.text = "₦30"
      priceLabel.textColor =  .green
      priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
      priceLabel.snp.makeConstraints { (make) in
         make.centerY.equalTo(nameLabel)
         make.right.equalTo(transactionView4.snp.right).offset(-40)
         make.width.equalTo(transactionView4.snp.width).multipliedBy(0.15)
         make.height.equalTo(transactionView4.snp.height).multipliedBy(0.4)
      }
      
   }
   
   
   func setupStackView() {
      stackView = UIStackView()
      cardsView.addSubview(stackView)
      stackView.backgroundColor = .blue
      stackView.distribution = .fillEqually
      stackView.axis = .vertical
      
      stackView.addArrangedSubview(transactionView)
      stackView.addArrangedSubview(transactionView2)
      stackView.addArrangedSubview(transactionView3)
      stackView.snp.makeConstraints { (make) in
         make.top.equalTo(dayLabel.snp.bottom)
         make.width.equalTo(cardsView.snp.width).multipliedBy(0.9)
         make.bottom.equalTo(cardsView.snp.bottom).offset(-110)
         make.centerX.equalTo(cardsView)
      }
   }
   
   func setUpContinueButton() {
      cardsView.addSubview(continueButton)
      continueButton.layer.cornerRadius = 3
      continueButton.backgroundColor = UIColor(named: "FundallGreen")
      continueButton.setTitle("continue".uppercased(), for: .normal)
      continueButton.setTitleColor(.black, for: .normal)
      continueButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
      continueButton.addTarget(self, action: #selector(didPressContinueBtn), for: .touchUpInside)
      continueButton.snp.makeConstraints { (make) in
         make.centerX.equalTo(cardsView)
         make.width.equalTo(cardsView.snp.width).multipliedBy(0.9)
         make.height.equalTo(32)
         make.top.equalTo(stackView.snp.bottom).offset(32)
      }
   }
   
   @objc func didPressContinueBtn() {
      
   }
   
   @objc func didPressBack() {
      dismiss(animated: true, completion: nil)
   }
   
}
