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
    
    func loadUrl() {
        guard let urlString = interactor?.url,
              let url = URL.init(string: urlString) else { return }
        view?.loadUrl(url: url)
    }
}

extension WebSitePresenter: InteractorToPresenterWebSiteProtocol {
    
}
