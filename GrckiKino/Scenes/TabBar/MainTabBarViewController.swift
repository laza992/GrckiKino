//
//  MainTabBarViewController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - Properties
    
    var viewModel: MainTabBarViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = ColorName.themeBlue.color
        tabBar.unselectedItemTintColor = ColorName.lightBlue.color
        tabBar.tintColor = ColorName.themeYelow.color
        tabBar.isTranslucent = false
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        addViewControllersToTabBar()
    }
    
    // MARK: - Private Methods
    
    private func addViewControllersToTabBar() {
        let boardVC = StoryboardScene.Board.boardViewController.instantiate()
        boardVC.viewModel = BoardViewModel(viewModel.drawID)
        boardVC.tabBarItem = UITabBarItem(title: "Talon", image: Asset.fourBoxes.image, tag: 0)
    
        let liveDrawVC = StoryboardScene.Draw.liveDrawViewController.instantiate()
        //liveDrawVC.viewModel = PlacesViewModel()
        liveDrawVC.tabBarItem = UITabBarItem(title: "Izvlačenje uživo", image: Asset.playButton.image, tag: 1)
    
        let resultsVC = StoryboardScene.Draw.liveDrawViewController.instantiate()
        //resultsVC.viewModel = PlacesViewModel()
        resultsVC.tabBarItem = UITabBarItem(title: "Rezultati izvlačenja", image: Asset.results.image, tag: 2)
    
        viewControllers = [boardVC, liveDrawVC, resultsVC]
    
        self.selectedIndex = 0
    }
}
