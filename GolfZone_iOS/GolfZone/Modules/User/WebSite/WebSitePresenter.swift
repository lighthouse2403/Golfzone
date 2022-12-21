//
//  WebSitePresenter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation

class WebSitePresenter: ViewToPresenterWebSiteProtocol {
    // MARK: Properties
    var view: PresenterToViewWebSiteProtocol?
    var interactor: PresenterToInteractorWebSiteProtocol?
    var router: PresenterToRouterWebSiteProtocol?
}

extension WebSitePresenter: InteractorToPresenterWebSiteProtocol {
    
}
