//
//  stocksCustomCell.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 29/05/2021.
//

import UIKit


class StocksCustomCell: UITableViewCell {
    
  
        
    var cellView = UIView()
    var exerciseImage = UIImageView()
    var sessionName = UILabel()
    var exerciseName = UILabel()
    var practicedAtBpm = UILabel()
    
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0.2, alpha: 1)
    setupCellView()
    setupExerciseImageView()
    setupSessionLabel()
    setupExerciseName()
    setupDatePracticed()
        
    
}
    
    override func prepareForReuse() {
        exerciseImage.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
func setupCellView() {
    cellView = UIView()
    contentView.addSubview(cellView)
    cellView.backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 0.4);        cellView.layer.cornerRadius = 8
    cellView.snp.makeConstraints { (make) in
        make.top.equalTo(contentView).offset(10)
        make.left.equalTo(contentView.snp.left).offset(15)
        make.right.equalTo(contentView.snp.right).offset(-15)
        make.bottom.equalTo(contentView.snp.bottom)
    }
}
    
func setupSessionLabel() {
    sessionName = UILabel()
    sessionName.text = "THE STOCK"
    sessionName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    sessionName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    cellView.addSubview(sessionName)
    sessionName.snp.makeConstraints { (make) in
        make.top.equalTo(exerciseImage.snp.top)
        make.left.equalTo(exerciseImage.snp.right).offset(20)
        make.right.equalTo(cellView).offset(-20)
    }
}
    
func setupExerciseImageView() {
    exerciseImage = UIImageView()
    cellView.addSubview(exerciseImage)
    exerciseImage.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
    exerciseImage.layer.cornerRadius = 25
    exerciseImage.snp.makeConstraints { (make) in
        make.centerY.equalTo(cellView)
        make.left.equalTo(cellView.snp.left).offset(20)
        make.height.width.equalTo(50)
        
    }
}
    
func setupExerciseName() {
    exerciseName = UILabel()
    exerciseName.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    exerciseName.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    exerciseName.text = "the other text"
    cellView.addSubview(exerciseName)
    exerciseName.snp.makeConstraints { (make) in
        make.top.equalTo(sessionName.snp.bottom).offset(10)
        make.left.equalTo(exerciseImage.snp.right).offset(20)
        make.right.equalTo(cellView).offset(-20)
    }
}
    
func setupDatePracticed() {
    practicedAtBpm = UILabel()
    practicedAtBpm.font = UIFont.systemFont(ofSize: 10, weight: .light)
    practicedAtBpm.textColor = #colorLiteral(red: 0.02638461016, green: 0.8802832795, blue: 0, alpha: 1)
    practicedAtBpm.text = "ꜛ300"
    cellView.addSubview(practicedAtBpm)
    practicedAtBpm.snp.makeConstraints { (make) in
        make.centerY.equalTo(exerciseImage)
        make.right.equalTo(cellView.snp.right).offset(-20)
    }
}
    
}
