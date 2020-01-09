//
//  QuestionBaseViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 07/01/2020.
//  Copyright © 2020 Marko Zivko. All rights reserved.
//

import UIKit

class QuestionBaseViewController: UIViewController {

    public var userFinishedSelection: (([Answer]) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func registerUserSelectedAnswers(callback: @escaping ([Answer]) -> ()) {
        userFinishedSelection = callback
    }
}
