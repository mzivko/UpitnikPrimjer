//
//  CollectionViewController.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 20/12/2019.
//  Copyright © 2019 Marko Zivko. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let containerView = UIView()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var collectionData = ["🍓", "🍗", "🍑", "👩🏼‍🦳", "📚", "👙", "💤", "🌟"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.view.addSubview(containerView)
        
        containerView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height / 3)
        }
        
        let width = (view.frame.size.width - 20) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(nextPage))
        
        setupNavigationBar()
        setupLabels()
        setupProgressView()
        setupCollectionView()
    }
    
    @objc func nextPage(){
        let _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "View2") as? CollectionViewController {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    func setupLabels(){
        let questionLabel = UILabel()
        questionLabel.text = "What are your goals?"
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
    
    func setupCollectionView(){
        
        collectionView.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.allowsMultipleSelection = true
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! AnswerCollectionViewCell
        cell.emojiLabel.text = collectionData[indexPath.row]
        cell.textLabel.text = "Some text"
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? AnswerCollectionViewCell{
            cell.view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.view.layer.borderWidth = 3
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? AnswerCollectionViewCell{
            cell.view.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            cell.view.layer.borderWidth = 2
        }
        
    }
    
}
