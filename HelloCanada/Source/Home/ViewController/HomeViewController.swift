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
    let tableView : UITableView = {
        let homeTableView = UITableView()
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        return homeTableView
    }()
    var noResponseLabel: UILabel!
    var canadaDetails: AboutCanadaResponse?
    var presentor:HomeViewPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeViewRouter.createHomeViewModule(homeViewRef: self)
        setUpView()
        // activityIndicatorView.startAnimating()
        presentor?.viewDidLoad()
    }

    func setUpView() {
        setUpTableView()
    }

    func setUpTableView() {

        view.addSubview(tableView)

        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(AboutCanadaTableViewCell.self, forCellReuseIdentifier: "AboutCanadaCell")
    }
}

// MARK: - Presenter Protocols
extension HomeViewController: HomeViewProtocol {

    func showCountryDetails(forTheCountry canada: AboutCanadaResponse) {
        noResponseLabel?.isHidden = true
        canadaDetails = canada
        // activityIndicatorView.stopAnimating()
        navigationItem.title = canadaDetails?.title
        tableView.reloadData()
    }

    func showAPIError(message: String) {
        noResponseLabel?.isHidden = false
        noResponseLabel?.text = message
        // activityIndicatorView.stopAnimating()
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
        (cell as? AboutCanadaTableViewCell)?.titleLabel.text = aboutCanada.title
        (cell as? AboutCanadaTableViewCell)?.descriptionLabel.text = aboutCanada.description
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }

}
