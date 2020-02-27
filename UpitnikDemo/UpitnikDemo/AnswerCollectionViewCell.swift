//
//  AnswerCollectionViewCell.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 20/12/2019.
//  Copyright © 2019 Marko Zivko. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    public static let height = 80.0
}

class AnswerCollectionViewCell: UICollectionViewCell {
    
    let view = UIView()
    var vitaminLabel = UILabel()
    var backView = UIView()
    var titleLabel = UILabel()
    var instructionsLabel = UILabel()
    var likesLabel = UILabel()
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(self.view)
        
        self.view.snp.makeConstraints{ (make) in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
        
        self.backView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.backView.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.backView.layer.cornerRadius = 10
        self.view.addSubview(self.backView)
        
        self.backView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(Constants.height)
        }
        
        //TODO: will be changed to image view
        self.vitaminLabel.text = "💎"
        self.vitaminLabel.font = .systemFont(ofSize: 34.0)
        self.backView.addSubview(self.vitaminLabel)
        
        self.vitaminLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.titleLabel.text = "Vitamin D"
        self.titleLabel.font = .boldSystemFont(ofSize: 16.0)
        self.view.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.backView.snp.trailing).offset(5)
            make.top.equalTo(self.backView.snp.top).inset(5)
        }
        
        self.instructionsLabel.text = "Read label instructions"
        self.instructionsLabel.font = .systemFont(ofSize: 12.0)
        self.instructionsLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.view.addSubview(self.instructionsLabel)
        
        self.instructionsLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.titleLabel)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
        }
        
        self.likesLabel.text = "2.1k likes"
        self.likesLabel.font = .systemFont(ofSize: 12.0)
        self.likesLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.view.addSubview(self.likesLabel)
        
        self.likesLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.titleLabel)
            make.top.equalTo(self.instructionsLabel.snp.bottom).offset(3)
        }
        
        
        
        
        
//        view.addSubview(emojiLabel)
//
//        emojiLabel.font = UIFont.systemFont(ofSize: 42)
//        emojiLabel.textAlignment = .center
//        emojiLabel.snp.makeConstraints{ make in
//            make.center.centerX.centerY.equalToSuperview()
//        }
//
//        view.addSubview(textLabel)
//
//        textLabel.font = UIFont.systemFont(ofSize: 14)
//        textLabel.snp.makeConstraints{ make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(view.snp.bottom).inset(15)
//        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
