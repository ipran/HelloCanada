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
    let noResponseLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        return label
    }()
    var canadaDetails: AboutCanadaResponse?
    var presentor:HomeViewPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeViewRouter.createHomeViewModule(homeViewRef: self)
        setUpView()
        showActivityIndicator()
        presentor?.viewDidLoad()
    }

    func setUpView() {
        setUpTableView()
        setUpNoResponseLabel()
    }

    func setUpNoResponseLabel() {
        view.addSubview(noResponseLabel)

        noResponseLabel.snp.makeConstraints { (make) in
            make.center.equalTo(tableView)
            make.centerY.equalTo(tableView)
            make.left.equalTo(tableView)
            make.right.equalTo(tableView)
        }
    }

    func setUpTableView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view)
            make.top.equalTo(view)
        }

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(AboutCanadaTableViewCell.self, forCellReuseIdentifier: "AboutCanadaCell")
    }
}

// MARK: - Presenter Protocols
extension HomeViewController: HomeViewProtocol {
    
    func showCountryDetails(forTheCountry canada: AboutCanadaResponse) {
        noResponseLabel.isHidden = true
        canadaDetails = canada
        hideActivityIndicator()
        navigationItem.title = canadaDetails?.title
        tableView.separatorStyle = .singleLine
        tableView.reloadData()
    }

    func showAPIError(message: String) {
        tableView.separatorColor = UIColor.clear
        tableView.setNeedsDisplay()
        noResponseLabel.isHidden = false
        noResponseLabel.text = Messages.noDetailsFound
        hideActivityIndicator()
        self.view.showToast(Messages.noDetailsFound)
    }
}

// MARK: - TableView Delegate and Datasource
extension HomeViewController:UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return canadaDetails?.rows?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCanadaCell", for: indexPath) as! AboutCanadaTableViewCell
        guard let aboutCanada = canadaDetails?.rows?[indexPath.row] else {
            return cell
        }
        cell.titleLabel.text = aboutCanada.title
        cell.descriptionLabel.text = aboutCanada.description
        if let imageURL = aboutCanada.imageHref {
            cell.descriptionImageView.loadImageFrom(imageURL.url!)
        } else {
            cell.descriptionImageView.image = #imageLiteral(resourceName: "no_image")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
