//
//  LiveDrawViewController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit
import WebKit

class LiveDrawViewController: BaseViewController {

    // MARK: - Properties
    
    private var customView: LiveDrawView!{
        loadViewIfNeeded()
        return view as? LiveDrawView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView.setup(delegate: self)
    }
}

// MARK: - WKNavigationDelegate

extension LiveDrawViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showProgressHUD()
        customView.webView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.customView.webView.isHidden = false
        self.hideProgressHUD()
        customView.webView.evaluateJavaScript("document.querySelector('#ac-globalnav').remove();") { (result, error) in
            if error == nil {
                // header is hide now
                debugPrint("removed header")
            }
        }
        
    }
}
