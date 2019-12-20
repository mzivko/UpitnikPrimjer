//
//  ViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 18/12/2019.
//  Copyright © 2019 Marko Zivko. All rights reserved.
//

import UIKit
import SnapKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let containerView = UIView()
    let answers = ["💪🏻 I train every day", "🙂 A couple timer per week", "😕 Not enough"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        containerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.view.addSubview(containerView)
        
        containerView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height / 3)
        }
        
        setupNavigationBar()
        setupLabels()
        setupProgressView()
        setupTableView()
        
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    func setupLabels(){
        let questionLabel = UILabel()
        questionLabel.text = "How active are you?"
        questionLabel.font = UIFont.boldSystemFont(ofSize: 28)
        questionLabel.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        containerView.addSubview(questionLabel)
        
        questionLabel.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        let secondPartOnboardingLabel = UILabel()
        secondPartOnboardingLabel.text = "HABITS AND BEHAVIORS (2/2)"
        secondPartOnboardingLabel.font = UIFont.systemFont(ofSize: 10)
        secondPartOnboardingLabel.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.addSubview(secondPartOnboardingLabel)
        
        secondPartOnboardingLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(containerView).inset(15)
        }
    }
    
    func setupProgressView(){
        let progressView = UIProgressView()
        progressView.progressTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        progressView.trackTintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        progressView.progress = 0.5
        containerView.addSubview(progressView)
        
        progressView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(3)
        }
    }
    
    func setupTableView(){
        let tableViewCustome = UITableView()
        tableViewCustome.separatorStyle = .none
        tableViewCustome.isScrollEnabled = false
        tableViewCustome.register(AnswerCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableViewCustome)
        
        tableViewCustome.snp.makeConstraints{ make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom)
        }
        
        tableViewCustome.delegate = self
        tableViewCustome.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnswerCell
        cell.textLabel?.text = answers[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AnswerCell{
            cell.accessoryType = .checkmark
            cell.cellButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.cellButton.layer.borderWidth = 3
            
            let _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "View") as? TableViewController {
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AnswerCell{
            cell.accessoryType = .none
            cell.cellButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            cell.cellButton.layer.borderWidth = 2
        }
    }
}

