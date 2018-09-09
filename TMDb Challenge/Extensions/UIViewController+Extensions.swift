//
//  UIViewController+Extensions.swift
//  TMDb Challenge
//
//  Created by Gabriel Minucci on 09/09/18.
//  Copyright © 2018 Minucci. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static let loadingViewIdentifier = "LoadingViewIdentifier"
    
    func showLoading(delayed: Double = 0.0) {
        guard view.subviews.filter({ $0.restorationIdentifier == UIViewController.loadingViewIdentifier }).isEmpty else {
            return
        }
        
        let ldgView = LoadingView(frame: view.frame)
        ldgView.restorationIdentifier = UIViewController.loadingViewIdentifier
        ldgView.alpha = 0.0
        view.addSubview(ldgView)
        
        UIView.animate(withDuration: 0.2, delay: delayed, options: .curveEaseInOut, animations: {
            ldgView.alpha = 1.0
        })
    }
    
    func hideLoading() {
        guard let ldgView = view.subviews.filter({ $0.restorationIdentifier == UIViewController.loadingViewIdentifier }).first else {
            return
        }
        DispatchQueue.main.async {
            ldgView.removeFromSuperview()
        }
    }
    
}
