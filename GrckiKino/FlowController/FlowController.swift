//
//  FlowController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class FlowController {
    
    // MARK: - Properties
    
    unowned var currentViewController: UIViewController
    
    // MARK: - Lifecycle
    
    init(currentViewController: UIViewController) {
        self.currentViewController = currentViewController
    }
}
