//
//  LiveDrawView.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit
import WebKit

class LiveDrawView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Setup Methods
    
    func setup(delegate: WKNavigationDelegate) {
        webView.scrollView.isUserInteractionEnabled = false
        webView.navigationDelegate = delegate
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.load(URLRequest(url: Constants.ballDrawingURL))
    }
}
