//
//  HomeViewPresenter.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation
import UIKit

class HomeViewPresenter:HomeViewPresenterProtocol,HomeViewOutputInteractorProtocol {

    var view: HomeViewProtocol?
    var router: HomeViewRouterProtocol?
    var interactor: HomeViewInputInteractorProtocol?

    func viewDidLoad() {
        interactor?.fetchAboutCanadaDetails()
    }
    /**
     Fetch about canada list success call back
     */
    func aboutCanadaListDidFetch(aboutCanada: AboutCanadaResponse?) {
        if let aboutCanadaDetails = aboutCanada {
            self.view?.showCountryDetails(forTheCountry: aboutCanadaDetails)
        } else {
            self.view?.showAPIError(message: Messages.noDetailsFound)
        }
    }
    /**
     Fetch about canada list failed call back
     */
    func aboutCanadaListDidFetchFailed(error: Error?) {
        self.view?.showAPIError(message: error?.localizedDescription ?? Messages.somethingWentWrong)
    }
}
