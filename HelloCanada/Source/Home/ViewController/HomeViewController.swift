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
    var canadaDetails: AboutCanadaResponse?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }

    func setUpView() {
        setUpTableView()
    }

    func setUpTableView() {
        tableView?.delegate = self as! UITableViewDelegate
        tableView?.dataSource = self as! UITableViewDataSource
    }

}

