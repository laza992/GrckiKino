//
//  MainFlowController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

final class MainFlowController: FlowController {
    
    func goToMainTabBar(drawID: Int) {
        let mainVC = StoryboardScene.Main.mainTabBarViewController.instantiate()
        mainVC.viewModel = MainTabBarViewModel(drawID)
        currentViewController.present(mainVC, animated: true, completion: nil)
    }
}
