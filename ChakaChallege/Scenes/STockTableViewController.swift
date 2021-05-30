//
//  STockTableViewController.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 29/05/2021.
//

import UIKit

class STockTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StocksCustomCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    var tableview = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 0.4)
        setupTableView()
        navigationBar()
       
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
