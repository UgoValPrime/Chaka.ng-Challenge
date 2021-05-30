//
//  STockTableViewController.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 29/05/2021.
//

import UIKit

protocol GetStockListDisplayLogic {
   func displayResponse(prompt: StockResponse)
   func displayError(prompt: String)
}


class STockTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetStockListDisplayLogic {
    func displayResponse(prompt: StockResponse) {
        dataResponse = prompt.tickers
        tableview.reloadData()
        print("DATARESPONSE:::\(String(describing: dataResponse))")
    }
    
    func displayError(prompt: String) {
        print("ERROR:::\(prompt)")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataResponse?.count ?? Int()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StocksCustomCell
        let current  = dataResponse?[indexPath.row]
        cell.data = current
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    var tableview = UITableView()
    var interactor: GetStockResponseBusinessLogic?
    var dataResponse: [Ticker]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 0.4)
        setupTableView()
        navigationBar()
        setUpDependencies()
        interactor?.getStockResponseData()
       
    }
    
    func setUpDependencies() {
       let interactor = GetStockListInteractor()
       let worker = StockResponseWorker()
       let presenter = GetStockListPresenter()
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
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Asset List"
        navigationController?.navigationBar.barStyle = .black
       navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }

    
    
   func setupTableView() {
    view.addSubview(tableview)
    tableview.backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 0.4)
    tableview.delegate = self
    tableview.dataSource = self
    tableview.separatorStyle = .none
    tableview.register(StocksCustomCell.self, forCellReuseIdentifier: "Cell")
    tableview.snp.makeConstraints { (make) in
       make.top.equalTo(view.snp.top).offset(180)
       make.centerX.equalTo(view)
       make.width.equalTo(view.snp.width).multipliedBy(0.9)
        make.bottom.equalTo(view.snp.bottom).offset(-20)
    }
    }

}
