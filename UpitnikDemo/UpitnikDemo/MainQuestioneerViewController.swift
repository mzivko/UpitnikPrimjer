//
//  MainQuestioneerViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 07/01/2020.
//  Copyright © 2020 Marko Zivko. All rights reserved.
//

import UIKit

class MainQuestionnaireViewController: UIViewController {
    
    var questionList: [Question] = []
    var receivedAnswers: [[Answer]] = []
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionList = getQuestions()
        showQuestion(index: 0)
        
    }
    
    func showQuestion(index: Int) {
        if questionList.count > 0 {
            let question = questionList[index]
            presentQuestionController(question: question)
        }
    }
    
    func presentQuestionController(question: Question) {
        
        let vc: QuestionBaseViewController
        
        switch question.type {
        case .singleSelection:
             vc = SingleQuestionViewController()
            break
        case .multipleSelection:
             vc = MultipleQuestionViewController()
            break
        }
        
        vc.registerUserSelectedAnswers { [weak self] (answers) in
            self?.answersReceived(answerList: answers)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //promjeni ime
    func answersReceived(answerList: [Answer]) {
        receivedAnswers.append(answerList)
        currentQuestionIndex += 1
        
        if currentQuestionIndex <= questionList.count{
            showQuestion(index: currentQuestionIndex)
        } else {
            //nema pitanja, kontaktiraj server 
        }
    }
    
    
    //ide u servis
    func getQuestions() -> [Question] {
        
        let answer1 = Answer(emoji: "😂", text: "happy", value: "happy")
        let answer2 = Answer(emoji: "😕", text: "sad", value: "sad")
        let answer3 = Answer(emoji: "🌟", text: "star", value: "star")
        
        
        let question1 = Question(answers: [answer1, answer2, answer3], id: "goals", title: "goals", type: .singleSelection)
        let question2 = Question(answers: [answer2, answer1, answer3], id: "new goals", title: "new goals", type: .singleSelection)
        
        return [question1, question2]
    }
}


public enum QuestionType {
    
    case singleSelection, multipleSelection
    
}

public struct Question {
    
    let answers: [Answer]
    let id: String
    let title: String
    let type: QuestionType
    
}

public struct Answer {
    
    let emoji: String
    let text: String
    let value: String
    
}
