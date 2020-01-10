//
//  QuestionBaseViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 07/01/2020.
//  Copyright © 2020 Marko Zivko. All rights reserved.
//

import UIKit
import SnapKit


class QuestionBaseViewController: UIViewController {
    
    var question: Question
    let containerView = UIView()
    let progressView = UIProgressView()
    
    init(question: Question) {
        self.question = question
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var userFinishedSelection: (([Answer]) -> ())?
    
    public func registerUserSelectedAnswers(callback: @escaping ([Answer]) -> ()) {
        userFinishedSelection = callback
    }
    
    internal func setupProgressView(){
        progressView.progressTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        progressView.trackTintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.addSubview(progressView)
        
        progressView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(3)
        }
    }
    
    public func setupProgressViewValue(progressValue: Float) {
        progressView.progress = progressValue
    }
}
