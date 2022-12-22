//
//  BaseViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import UIKit

class BaseViewController: UIViewController {
    private let rightButton = UIButton(type: .custom)
    private var loadingView = UIView()
    private let spinnerView = SpinnerView()
    
    override func viewDidLoad() {
        setupNavigationbarColor()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    // MARK: - Setup UI
    func setupUI() {
    }

    func setupNavigationBar(title: String = "",
                            titleLeftItem: String?) {
        self.title = title
        addLeftBarItem(imageName: "ico_back", selectedImage: "ico_back", title: "")
    }
   
    func setupNavigationbarColor() {
        guard let navigationBar = navigationController?.navigationBar else {return}

        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundImage = UIColor(hexString: "#9DD2E9").navBarImage()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        } else {
            navigationBar.setBackgroundImage(UIColor.white.navBarImage(), for: .default)
        }
    }
    
    func addLeftBarItem(imageName: String, selectedImage: String, title: String) {
        let leftButton = UIButton.init(type: UIButton.ButtonType.custom)
        leftButton.isExclusiveTouch = true
        leftButton.isSelected       = false
        leftButton.frame            = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        leftButton.addTarget(self, action: #selector(tappedLeftBarButton(sender:)), for: UIControl.Event.touchUpInside)
        if title.count > 0 {
            leftButton.frame = CGRect.init(x: 0, y: 0, width: 80, height: 40)
            leftButton.setTitle(title, for: UIControl.State.normal)
            leftButton.setTitleColor(.black, for: .normal)
            leftButton.titleLabel?.font = .systemFont(ofSize: 17)
        }
        if imageName.count > 0 {
            leftButton.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            leftButton.setImage(UIImage(named: imageName), for: UIControl.State.normal)
            leftButton.setImage(UIImage(named: selectedImage), for: UIControl.State.selected)
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
    }
    
    func addRightBarItem(imageName: String, imageTouch: String, title : String) {
        let rightButton = UIButton.init(type: UIButton.ButtonType.custom)
        rightButton.isExclusiveTouch = true
        rightButton.isSelected       = false
        rightButton.frame            = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        rightButton.addTarget(self, action: #selector(tappedRightBarButton(sender:)), for: UIControl.Event.touchUpInside)
        if title.count > 0 {
            rightButton.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            rightButton.setTitle(title, for: UIControl.State.normal)
            rightButton.titleLabel?.textAlignment = .right
            rightButton.setTitleColor(.black, for: .normal)
            rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        if imageName.count > 0 {
            rightButton.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            rightButton.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        }
        if imageTouch.count > 0 {
            rightButton.setImage(UIImage(named: imageTouch), for: .selected)
        }
        rightButton.contentHorizontalAlignment = .right
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightButton)
    }
    
    func removeRightBarButton() {
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func removeLeftBarButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init()
    }
    
    func addTitle(title : String) {
        self.title = title
    }
    
    // MARK: - NavigationBar Action
    @objc func tappedLeftBarButton(sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedRightBarButton(sender : UIButton) {
    }
}

extension BaseViewController {
    func showLoading() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let window = delegate.window else { return }
        
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        spinnerView.lineWidth(5)
        
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        containerView.layer.cornerRadius = 8
        
        if loadingView.isDescendant(of: view) {
            view.bringSubviewToFront(loadingView)
            return
        }
        window.addSubview(loadingView)
        loadingView.addSubview(containerView)
        containerView.addSubview(spinnerView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        // Set contraints to full view
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: window.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: window.bottomAnchor),
            loadingView.rightAnchor.constraint(equalTo: window.rightAnchor),
            loadingView.leftAnchor.constraint(equalTo: window.leftAnchor),
            
            containerView.widthAnchor.constraint(equalToConstant: 85),
            containerView.heightAnchor.constraint(equalToConstant: 85),
            containerView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            
            spinnerView.widthAnchor.constraint(equalToConstant: 50),
            spinnerView.heightAnchor.constraint(equalToConstant: 50),
            spinnerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingView.removeFromSuperview()
            self.spinnerView.didMoveToWindow()
        }
    }
    
    var isLoading: Bool {
        return loadingView.superview != nil
    }
}

