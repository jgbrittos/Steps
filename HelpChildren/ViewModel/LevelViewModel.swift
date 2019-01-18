//
//  LevelViewModel.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class LevelViewModel {
    
    var levels: [Activity] = [Activity]()
    var updateLevelsList: (()->())?
    
    var menu: [Menu] = [Menu]() {
        didSet {
            self.updateLevelsList?()
        }
    }
    
    func loadData() {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!

        let jsonData = try! Data(contentsOf: url)
        let data = try! JSONDecoder().decode(Level.self, from: jsonData)
        
        levels = data.levels
        menu = data.menu
    }
    
    func filterBy(level: Int) -> [Activity] {
        return self.levels.filter { $0.level == level }
    }
}
