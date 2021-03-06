//
//  BookingTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/29/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class BookingTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = TABBARS.Booking
        view.backgroundColor = UIColor.white
        
        setupViews()
    }
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.fromHEX(string: "#1D3C5F").cgColor
        button.setTitle(LABELS.Login, for: .normal)
        button.setTitleColor(UIColor.fromHEX(string: "#1D3C5F"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    let aintxButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.fromHEX(string: "#008080").cgColor
        button.setTitle(LABELS.Aintx, for: .normal)
        button.setTitleColor(UIColor.fromHEX(string: "#008080"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(goAintx), for: .touchUpInside)
        return button
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.fromHEX(string: "#1D3C5F").cgColor
        button.setTitle(LABELS.Logout, for: .normal)
        button.setTitleColor(UIColor.fromHEX(string: "#1D3C5F"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    let loginNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.fromHEX(string: "#008080")
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    private func setupViews() {
        view.addSubview(aintxButton)
        view.addSubview(loginButton)
        view.addSubview(logoutButton)
        view.addSubview(loginNameLabel)
        
        view.addConstraints(format: "H:[v0(120)]", views: aintxButton)
        view.addConstraints(format: "V:[v0(40)]-40-[v1(40)]-40-[v2(40)]", views: aintxButton, loginButton, logoutButton)
        aintxButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aintxButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addConstraints(format: "H:[v0(120)]", views: loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addConstraints(format: "H:[v0(120)]", views: logoutButton)
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addConstraints(format: "H:[v0(200)]", views: loginNameLabel)
        view.addConstraints(format: "V:[v0(80)]", views: loginNameLabel)
        loginNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func loginTapped() {
//        let url = URL(string: URLS.Host + "%&2")!
//        let params = ["loginType": "0", "password": "00313131", "username": "660265538998", "verifyCode2": ""]
//        Alamofire.request(url, parameters: params).responseJSON { (jsonData) in
//            print(jsonData)
//        }
    }
    
    @objc func logoutTapped() {
        UserConfig.shared.userLogout()
        loginButton.alpha = 1
        aintxButton.alpha = 1
        logoutButton.alpha = 1
        loginNameLabel.alpha = 0
    }
    
    var alertView: AlertView?
    
    @objc func goAintx() {
        print(#function)
        alertView = AlertView()
        alertView?.show(UIApplication.shared.keyWindow!, parent: self)
    }
    
    func removeAlert() {
        alertView = nil
    }

}

class AlertView: UIView {
    
    deinit {
        print(#function)
    }

    let blackView: UIView = {
        let view = UIView()
        return view
    }()
    
    var parent: UIViewController?
    
    func show(_ window: UIWindow, parent: UIViewController) {
        blackView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        blackView.frame = window.frame
        blackView.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        blackView.addGestureRecognizer(tapGesture)
        
        window.addSubview(blackView)
        self.parent = parent
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
        }, completion: { _ in
        })
        if let parent = parent as? BookingTabViewController {
            parent.removeAlert()
        }
    }
}
