//
//  HomeViewRouter.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

class HomeViewRouter: HomeViewRouterProtocol {
    /**
     Assemble home module
     */
    static func createHomeViewModule(homeViewRef: HomeViewController) {
        let presenter:HomeViewPresenterProtocol & HomeViewOutputInteractorProtocol = HomeViewPresenter()
        presenter.router = HomeViewRouter()
        presenter.view = homeViewRef as? HomeViewProtocol
        presenter.interactor = HomeViewInteractor(presenter: presenter)
        homeViewRef.presentor = presenter
    }
}
