//
//  BaseViewController.swift
//  fyre
//
//  Created by Lazar Vlaovic on 7/8/20.
//  Copyright © 2020 Lazar Vlaovic. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private var indicatorView: NVActivityIndicatorView?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setupIndicatorView(frame: view.frame)
    }
    
    // MARK: - Methods
    
    func setupIndicatorView(frame: CGRect, color: UIColor = ColorName.themeYelow.color) {
        let indicatorSize: CGFloat = 100
        let midPoint: CGPoint
        if let navigationController = navigationController, !navigationController.isNavigationBarHidden {
            midPoint = CGPoint(x: frame.midX - indicatorSize / 2, y: frame.midY - 50 - navigationController.navigationBar.frame.height)
        } else {
            midPoint = CGPoint(x: frame.midX - indicatorSize / 2, y: frame.midY - indicatorSize / 2)
        }
        let viewSize = CGSize(width: indicatorSize, height: indicatorSize)
        
        indicatorView = NVActivityIndicatorView(frame: CGRect(origin: midPoint, size: viewSize))
        
        indicatorView?.type = .circleStrokeSpin
        indicatorView?.color = color
        
        view.addSubview(indicatorView!)
    }
    
    func showProgressHUD() {
        indicatorView?.startAnimating()
        userInteraction(enabled: false)
    }
    
    func hideProgressHUD() {
        indicatorView?.stopAnimating()
        userInteraction(enabled: true)
    }

    private func userInteraction(enabled: Bool) {
        view.isUserInteractionEnabled = enabled
    }
}
