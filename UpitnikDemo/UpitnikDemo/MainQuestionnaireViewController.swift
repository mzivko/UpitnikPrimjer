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
        if questionList.count > index {
            let question = questionList[index]
            presentQuestionController(question: question)
        }
    }
    
    func presentQuestionController(question: Question) {
        
        let vc: QuestionBaseViewController
        
        switch question.type {
        case .singleSelection:
             vc = SingleQuestionViewController(question: question)
            break
        case .multipleSelection:
            vc = MultipleQuestionViewController(question: question)
            break
        }
        
        vc.registerUserSelectedAnswers { [weak self] (answers) in
            self?.answersReceived(answerList: answers)
        }
        vc.setupProgressViewValue(progressValue: Float(Float(currentQuestionIndex + 1) / Float(questionList.count)))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //promjeni ime
    func answersReceived(answerList: [Answer]) {
        receivedAnswers.append(answerList)
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questionList.count {
            showQuestion(index: currentQuestionIndex)
        } else {
            //nema pitanja, kontaktiraj server
            print("Dobili smo sve odgovore")
            for i in 0...questionList.count - 1 {
                print(receivedAnswers[i])
            }
            
            let alertController = UIAlertController(title: "Finished!", message:
                "You answered to all questiones!", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    //ide u servis
    func getQuestions() -> [Question] {
        
        let answer1 = Answer(emoji: "💪🏻", text: "I train every day", value: "every_day")
        let answer2 = Answer(emoji: "😊", text: "A couple times per week", value: "couple_times_per_week")
        let answer3 = Answer(emoji: "😕", text: "Not enough", value: "not_enough")
        let answer4 = Answer(emoji: "🍓", text: "Lose weight", value: "lose_weight")
        let answer5 = Answer(emoji: "🍗", text: "Gain weight", value: "gain_weight")
        let answer6 = Answer(emoji: "🍑", text: "Better sex", value: "better_sex")
        let answer7 = Answer(emoji: "👩🏼‍🦳", text: "Anti age", value: "anti_age")
        let answer8 = Answer(emoji: "📚", text: "Improve productivity", value: "improve_productivity")
        let answer9 = Answer(emoji: "👙", text: "Get fit", value: "get_fit")
        let answer10 = Answer(emoji: "💤", text: "Feel more rested", value: "feel_rested")
        let answer11 = Answer(emoji: "🌟", text: "Strenghten your mind", value: "strenghten_mind")
        
        
        let question1 = Question(answers: [answer1, answer2, answer3], id: "goals", title: "goals", type: .singleSelection)
        let question2 = Question(answers: [answer2, answer1, answer3], id: "new goals", title: "new goals", type: .singleSelection)
        let question3 = Question(answers: [answer4, answer5, answer6, answer7, answer8, answer9, answer10, answer11], id: "new  multiple goals", title: "new multiple  goals", type: .multipleSelection)
        
        return [question1, question3, question2, question2]
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

public struct Answer: Equatable {
    
    let emoji: String
    let text: String
    let value: String
    
}
