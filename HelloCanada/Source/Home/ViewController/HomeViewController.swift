//
//  HomeViewController.swift
//  HelloCanada
//
//  Created by Pranil on 2/2/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Declarations
    var tableView: UITableView?
    var noResponseLabel: UILabel?
    var canadaDetails: AboutCanadaResponse?
    var presentor:HomeViewPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeViewRouter.createHomeViewModule(homeViewRef: self)
        setUpView()
        // Show activity indicator
//        activityIndicatorView.startAnimating()
        presentor?.viewDidLoad()
    }

    func setUpView() {
        setUpTableView()
    }

    func setUpTableView() {

        tableView?.delegate = self as UITableViewDelegate
        tableView?.dataSource = self as UITableViewDataSource
        tableView?.backgroundColor = UIColor.red

        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        tableView?.register(AboutCanadaTableViewCell.self, forCellReuseIdentifier: "AboutCanadaCell")
        self.view.addSubview(tableView ?? UITableView())

        tableView?.tableFooterView = UIView(frame: CGRect.zero)
        self.navigationItem.title = canadaDetails?.title
    }
}

// MARK: - Presenter Protocols
extension HomeViewController: HomeViewProtocol {

    func showCountryDetails(forTheCountry canada: AboutCanadaResponse) {
        self.noResponseLabel?.isHidden = true
        self.canadaDetails = canada
//        self.activityIndicatorView.stopAnimating()
        self.tableView?.reloadData()
    }

    func showAPIError(message: String) {
        self.noResponseLabel?.isHidden = false
        self.noResponseLabel?.text = message
        self.tableView?.reloadData()
//        self.activityIndicatorView.stopAnimating()
    }
}

// MARK: - TableView Delegate and Datasource
extension HomeViewController:UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return canadaDetails?.rows?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCanadaCell", for: indexPath)
        guard let aboutCanada = canadaDetails?.rows?[indexPath.row] else {
            return cell
        }
        (cell as? AboutCanadaTableViewCell)?.titleLabel?.text = "aboutCanada.title"
        (cell as? AboutCanadaTableViewCell)?.descriptionLabel.text = aboutCanada.description
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }

}
