//
//  stocksCustomCell.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 29/05/2021.
//

import UIKit


class StocksCustomCell: UITableViewCell {
    
    var data: Ticker? {
       didSet {
          guard let data = data else { return }
//        logoImage.image = UIImage(named: data.image)
        stockName.text = data.name
        stockSymbol.text = data.ticker
            percentDifference.text = "ꜛ300"
       }
    }
        
    var cellView = UIView()
    var logoImage = UIImageView()
    var stockName = UILabel()
    var stockSymbol = UILabel()
    var percentDifference = UILabel()
    
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
        logoImage.image = nil
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
    stockName = UILabel()
    stockName.text = "THE STOCK"
    stockName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    stockName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    cellView.addSubview(stockName)
    stockName.snp.makeConstraints { (make) in
        make.top.equalTo(logoImage.snp.top)
        make.left.equalTo(logoImage.snp.right).offset(20)
        make.right.equalTo(cellView).offset(-20)
    }
}
    
func setupExerciseImageView() {
    logoImage = UIImageView()
    cellView.addSubview(logoImage)
    logoImage.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
    logoImage.layer.cornerRadius = 25
    logoImage.snp.makeConstraints { (make) in
        make.centerY.equalTo(cellView)
        make.left.equalTo(cellView.snp.left).offset(20)
        make.height.width.equalTo(50)
        
    }
}
    
func setupExerciseName() {
    stockSymbol = UILabel()
    stockSymbol.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    stockSymbol.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    stockSymbol.text = "the other text"
    cellView.addSubview(stockSymbol)
    stockSymbol.snp.makeConstraints { (make) in
        make.top.equalTo(stockName.snp.bottom).offset(10)
        make.left.equalTo(logoImage.snp.right).offset(20)
        make.right.equalTo(cellView).offset(-20)
    }
}
    
func setupDatePracticed() {
    percentDifference = UILabel()
    percentDifference.font = UIFont.systemFont(ofSize: 10, weight: .light)
    percentDifference.textColor = #colorLiteral(red: 0.02638461016, green: 0.8802832795, blue: 0, alpha: 1)
    percentDifference.text = "ꜛ300"
    cellView.addSubview(percentDifference)
    percentDifference.snp.makeConstraints { (make) in
        make.centerY.equalTo(logoImage)
        make.right.equalTo(cellView.snp.right).offset(-20)
    }
}
    
}
