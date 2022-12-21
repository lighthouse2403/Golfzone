//
//  WebSiteViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import UIKit
import WebKit

class WebSiteViewController: BaseViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterWebSiteProtocol?
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        addTitle(title: "Web Site")
    }
}

extension WebSiteViewController: PresenterToViewWebSiteProtocol{
    func loadUrl(url: URL) {
        webView.load(URLRequest.init(url: url))
    }
}
