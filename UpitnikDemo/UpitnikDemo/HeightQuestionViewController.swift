//
//  HeightQuestionViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 04/02/2020.
//  Copyright © 2020 Marko Zivko. All rights reserved.
//

import Foundation
import SnapKit

class HeightQuestionViewController: QuestionBaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let nextButton = UIButton()
    let feetsArray = ["0", "1", "2", "3", "4", "5", "6"]
    let inchesArray = ["0\"", "1\"", "2\"", "3\"", "4\"", "5\"", "6\"", "7\"", "8\"", "9\"", "10\"", "11"]
    let sizeTypeArray = ["ft in", "m"]
    
    override init(question: Question) {
        super.init(question: question)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.view.addSubview(containerView)
        
        containerView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height / 3)
        }
        
        setupNavigationBar()
        setupHeightPicker()
        setupLabels()
        setupProgressView()        
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func setupLabels(){
        let questionLabel = UILabel()
        questionLabel.text = "How tall are you?"
        questionLabel.font = UIFont.boldSystemFont(ofSize: 28)
        questionLabel.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        containerView.addSubview(questionLabel)
        
        questionLabel.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        let secondPartOnboardingLabel = UILabel()
        secondPartOnboardingLabel.text = "BASICS (1/2)"
        secondPartOnboardingLabel.font = UIFont.systemFont(ofSize: 10)
        secondPartOnboardingLabel.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.addSubview(secondPartOnboardingLabel)
        
        secondPartOnboardingLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(containerView).inset(15)
        }
    }
    
    func setupNextButton(){
        
        nextButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.setImage(UIImage(named: "nextScreen"), for: .normal)
        
        self.view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-100)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(40)
            make.height.equalTo(nextButton.snp.width)
        }
    }
    
    func setupHeightPicker() {
        
        let viewContainer = UIView()
        viewContainer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.view.addSubview(viewContainer)
        
        viewContainer.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(self.containerView.snp.bottom).offset(0)
        }
        
        viewContainer.addSubview(pickerView)
        
        pickerView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom).offset(20)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return feetsArray.count
        case 1:
            return inchesArray.count
        case 2:
            return sizeTypeArray.count
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return feetsArray[row]
        case 1:
            return inchesArray[row]
        case 2:
            return sizeTypeArray[row]
        default:
            break
        }
        return ""
    }
    
    
}
