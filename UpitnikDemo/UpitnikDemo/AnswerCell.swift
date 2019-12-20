//
//  AnswerCell.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 18/12/2019.
//  Copyright © 2019 Marko Zivko. All rights reserved.
//

import UIKit
import SnapKit

class AnswerCell: UITableViewCell {

    let cellButton = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellButton.layer.cornerRadius = 10
        cellButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cellButton.layer.borderWidth = 2
        addSubview(cellButton)
        
        //buttonState(cellButton)
        
        cellButton.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(7)
            make.height.equalTo(55)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
