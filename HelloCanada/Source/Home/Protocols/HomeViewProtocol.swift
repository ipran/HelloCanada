//
//  HomeViewProtocol.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: class {
    //PRESENTER -> VIEW
    func showCountryDetails(forTheCountry canada: AboutCanadaResponse)
    func showAPIError(message: String)
}

protocol HomeViewPresenterProtocol: class {
    //VIEW -> PRESENTER
    var interactor: HomeViewInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeViewRouterProtocol? {get set}
    func viewDidLoad()
}

protocol HomeViewInteractorProtocol: class {
    //PRESENTER -> INTERACTOR
    func fetchAboutCanadaDetails()
}

protocol HomeViewRouterProtocol: class {
    //PRESENTER -> ROUTER
    static func createHomeViewModule(homeViewRef: HomeViewController)
}
