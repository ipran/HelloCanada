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
    var interactor: HomeViewInputInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeViewRouterProtocol? {get set}
    func viewDidLoad()
}

protocol HomeViewInputInteractorProtocol: class {
    var presenter: HomeViewOutputInteractorProtocol? {get set}
    //PRESENTER -> INTERACTOR
    func fetchAboutCanadaDetails()
}

protocol HomeViewOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func aboutCanadaListDidFetch(aboutCanada: AboutCanadaResponse?)
    func aboutCanadaListDidFetchFailed(error: Error?)
}

protocol HomeViewRouterProtocol: class {
    //PRESENTER -> ROUTER
    static func createHomeViewModule(homeViewRef: HomeViewController)
}
