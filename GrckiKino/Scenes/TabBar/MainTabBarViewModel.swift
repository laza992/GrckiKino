//
//  MainTabBarViewModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import Foundation

protocol MainTabBarViewModelProtocol {
    var drawID: Int { get set }
}

final class MainTabBarViewModel: MainTabBarViewModelProtocol {
    
    // MARK: - Properties
    
    var drawID: Int
    
    // MARK: - Init
    
    init(_ drawId: Int) {
        self.drawID = drawId
    }
}
