//
//  AnswerCollectionViewCell.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 20/12/2019.
//  Copyright © 2019 Marko Zivko. All rights reserved.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    
    let view = UIView()
    var emojiLabel = UILabel()
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        addSubview(view)
        
        view.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(10)
        }
        
        view.addSubview(emojiLabel)
        
        emojiLabel.font = UIFont.systemFont(ofSize: 42)
        emojiLabel.textAlignment = .center
        emojiLabel.snp.makeConstraints{ make in
            make.center.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(textLabel)
        
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).inset(15)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
