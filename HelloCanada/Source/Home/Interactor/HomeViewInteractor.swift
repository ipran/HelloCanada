//
//  HomeViewInteractor.swift
//  HelloCanada
//
//  Created by Pranil on 2/3/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import Foundation

class HomeViewInteractor: HomeViewInputInteractorProtocol {
    // Declarations
    weak var presenter: HomeViewOutputInteractorProtocol?
    var apiManager = HelloCanadaAPIManager()

    init(presenter:HomeViewOutputInteractorProtocol) {
        self.presenter = presenter
    }

    /**
     Fetch all details about Canada
     */
    func fetchAboutCanadaDetails() {
        apiManager.fetchAboutCanadaDetails { (response) in
            switch response {
            case let .failiure(error):
                self.presenter?.aboutCanadaListDidFetchFailed(error: error)
                break
            case let .success(aboutCanada):
                self.presenter?.aboutCanadaListDidFetch(aboutCanada: aboutCanada)
                break
            }
        }
    }
}
