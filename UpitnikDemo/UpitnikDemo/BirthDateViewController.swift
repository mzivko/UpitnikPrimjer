//
//  BirthDateViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 12/03/2020.
//  Copyright © 2020 Marko Zivko. All rights reserved.
//

import UIKit

class BirthDateViewController: QuestionBaseViewController {

    private let bottomView = UIView()
    private let nameTextField = UITextField()
    
    override init(question: Question) {
        super.init(question: question)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        self.view.addSubview(containerView)
        
        containerView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height / 3)
        }
        
        self.setupLabels()
        self.setupBottomView()
    }
    
    func setupLabels() {
        let questionLabel = UILabel()
        questionLabel.text = "When's your birthday?"
        questionLabel.font = UIFont.boldSystemFont(ofSize: 28)
        questionLabel.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        containerView.addSubview(questionLabel)
        
        questionLabel.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        let secondPartOnboardingLabel = UILabel()
        secondPartOnboardingLabel.text = "New question type (2/2)"
        secondPartOnboardingLabel.font = UIFont.systemFont(ofSize: 10)
        secondPartOnboardingLabel.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.addSubview(secondPartOnboardingLabel)
        
        secondPartOnboardingLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(containerView).inset(15)
        }
    }
    
    func setupBottomView() {
        
        self.bottomView.backgroundColor = .yellow
        
        self.view.addSubview(self.bottomView)
        
        self.bottomView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.containerView.snp.bottom)
        }
        
        self.nameTextField.font = UIFont.systemFont(ofSize: 28)
        self.nameTextField.placeholder = "Your name"
        self.nameTextField.textAlignment = .center
        
        self.bottomView.addSubview(self.nameTextField)
        
        self.nameTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
