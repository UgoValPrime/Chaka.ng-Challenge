//
//  DetailsViewController.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 29/05/2021.
//

import UIKit
import SnapKit

protocol GetStockDetailsDisplayLogic {
   func displayResponse(prompt: StockDetailsModel)
   func displayError(prompt: String)
}

class DetailsViewController: UIViewController, GetStockDetailsDisplayLogic {
    func displayResponse(prompt: StockDetailsModel) {
        detailsData = prompt
        priceLabel.text = "Open:: \(detailsData?.welcomeOpen ?? Double())    Close:: \(detailsData?.close ?? Double())"
        let  percent = "\(PercentageChange().percentChange(open: detailsData?.welcomeOpen ?? Double(), close: detailsData?.close ?? Double()))".prefix(5)
        if percent.prefix(1) == "-"{
            percentLabel.textColor = .red
            percentLabel.text = "ꜜ\(percent)%"
        }else if percent.prefix(5) == "-nan" || percent.prefix(5) == "-0.00" || percentLabel.text == "-0.00%"{
            percentLabel.textColor = .white
            percentLabel.text = "0.00%"
        }else{
            percentLabel.textColor = .green
            percentLabel.text = "ꜛ\(percent)%"
        }
        let url = URL(string: "https://s3.polygon.io/logos/\(stockData?.ticker.lowercased() ?? String())/logo.png")
        self.assetLogoView.kf.setImage(with: url)
        print("details::>>>, \(prompt)")
    }
    
    func displayError(prompt: String) {
        print("ERROR:::\(prompt)")
    }
    
    
    var assetLogoView = UIImageView()
    var assetNamelabel = UILabel()
    var priceLabel = UILabel()
    var percentLabel = UILabel()
    var detailsData: StockDetailsModel?
    var interactor: GetStockDetailsResponseBusinessLogic?
    var stockData: Ticker?

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 0.4)
        navigationBar()
        setupAssetLogoView()
        setupAssetNameLabel()
        setupPriceLabel()
        setupPercentLabel()
        setUpDependencies()
        if let unwrappedTickerValue = stockData?.ticker {
            interactor?.getStockDeatailsResponseData(url: "https://api.polygon.io/v1/open-close/\(unwrappedTickerValue.uppercased())/2020-10-14?unadjusted=true&apiKey=bUy3ML7tgpRaXC96KVFPC8O2gjU6Als2" )
        }
    }
    
    
    func setUpDependencies() {
       let interactor = GetStockDetailsInteractor()
       let worker = StockDetailsResponseWorker()
       let presenter = GetStockDetailsPresenter()
       let networkClient = ChakaApiClient()
       
       interactor.worker = worker
       interactor.presenter = presenter
       worker.networkClient = networkClient
       presenter.view = self
       self.interactor = interactor
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
        assetLogoView.contentMode = .scaleAspectFit
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
        assetNamelabel.text = stockData?.name
        assetNamelabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        assetNamelabel.textAlignment = .center
        assetNamelabel.textColor = .white
        assetNamelabel.numberOfLines = 0
        assetNamelabel.lineBreakMode = .byWordWrapping
        assetNamelabel.snp.makeConstraints { (make) in
            make.top.equalTo(assetLogoView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
//            make.height.equalTo(30)
        }
    }
    
    func setupPriceLabel() {
        view.addSubview(priceLabel)
       
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
