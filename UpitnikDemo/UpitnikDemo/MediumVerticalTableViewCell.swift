//
//  MediumVerticalTableViewCell.swift
//  UpitnikDemo
//
//  Created by Marko Zivko on 27/02/2020.
//  Copyright © 2020 Marko Zivko. All rights reserved.
//

import UIKit

class MediumVerticalTableViewCell: UITableViewCell {
    
    
    let cellMainView = UIView()
    let topImageView = UIImageView()
    let workoutTypeLabel = UILabel()
    let workoutInfoLabel = UILabel()
    let workoutTitleLabel = UILabel()
    let workoutDescriptionLabel = UILabel()
    let workoutStartLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.cellMainView.layer.cornerRadius = 10
        addSubview(cellMainView)
        
        self.cellMainView.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        self.topImageView.contentMode = .scaleToFill
        self.topImageView.image = UIImage(named: "workout1")
        self.cellMainView.addSubview(self.topImageView)
        
        self.topImageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().inset(5)
            make.height.equalTo(self.cellMainView.snp.width).multipliedBy(0.5)
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
        
        self.workoutTypeLabel.text = "Fitness"
        self.workoutTypeLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.workoutTypeLabel.font = .systemFont(ofSize: 10.0)
        self.cellMainView.addSubview(self.workoutTypeLabel)
        
        self.workoutTypeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.topImageView.snp.bottom).offset(4)
            make.leading.equalTo(self.topImageView.snp.leading)
        }
        
        self.workoutTitleLabel.text = "Workout title"
        self.workoutTitleLabel.font = .boldSystemFont(ofSize: 21.0)
        self.cellMainView.addSubview(self.workoutTitleLabel)
        
        self.workoutTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.workoutTypeLabel.snp.bottom).offset(2)
            make.leading.equalTo(self.topImageView.snp.leading)
        }
        
        self.workoutInfoLabel.text = "Info • Info"
        self.workoutInfoLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.workoutInfoLabel.font = .systemFont(ofSize: 10.0)
        self.cellMainView.addSubview(self.workoutInfoLabel)
        
        self.workoutInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.workoutTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.topImageView.snp.leading)
        }
        
        self.workoutDescriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mollis malesuada massa, eu scelerisque urna pulvinar eget. Phasellus iaculis leo nunc, sit amet interdum purus aliquet ut."
        self.workoutDescriptionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.workoutDescriptionLabel.font = .systemFont(ofSize: 12.0)
        self.workoutDescriptionLabel.numberOfLines = 0
        self.workoutDescriptionLabel.lineBreakMode = .byWordWrapping
        self.cellMainView.addSubview(self.workoutDescriptionLabel)
        
        self.workoutDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.workoutInfoLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.topImageView.snp.leading)
            make.trailing.equalToSuperview()
        }
        
        self.workoutStartLabel.text = "Continue reading"
        self.workoutStartLabel.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.workoutStartLabel.font = .systemFont(ofSize: 12.0)
        self.cellMainView.addSubview(self.workoutStartLabel)
        
        self.workoutStartLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.workoutDescriptionLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.topImageView.snp.leading)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
