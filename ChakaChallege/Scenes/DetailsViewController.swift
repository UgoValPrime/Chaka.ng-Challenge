//
//  DetailsViewController.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 29/05/2021.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    var assetLogoView = UIImageView()
    var assetNamelabel = UILabel()
    var priceLabel = UILabel()
    var percentLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 0.4)
        navigationBar()
        setupAssetLogoView()
        setupAssetNameLabel()
        setupPriceLabel()
        setupPercentLabel()
    }
    
    
    func navigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.topAttached, barMetrics: UIBarMetrics.default)
       self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .white
       navigationController?.navigationBar.barStyle = .default
    }
    
    func setupAssetLogoView() {
        view.addSubview(assetLogoView)
        assetLogoView.layer.cornerRadius = 40
        assetLogoView.contentMode = .center
        assetLogoView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        assetLogoView.clipsToBounds = true
        assetLogoView.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.centerX.equalTo(view)
            make.height.width.equalTo(80)
            
        }
    }
     
    func setupAssetNameLabel() {
        view.addSubview(assetNamelabel)
        assetNamelabel.text = "Etherium"
        assetNamelabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        assetNamelabel.textAlignment = .center
        assetNamelabel.textColor = .white
        assetNamelabel.snp.makeConstraints { (make) in
            make.top.equalTo(assetLogoView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
    }
    
    func setupPriceLabel() {
        view.addSubview(priceLabel)
        priceLabel.text = "$2760"
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .lightGray
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(assetNamelabel.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(20)
        }
    }
    
    func setupPercentLabel() {
        view.addSubview(percentLabel)
        percentLabel.text = "ꜛ205%"
        percentLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        percentLabel.textAlignment = .center
        percentLabel.textColor = .green
        percentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(10)
        }
    }

}
