//
//  LevelViewModel.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class LevelViewModel {
    private let objects = ["baby", "dog", "door", "rain", "pig"]
    
    var levels: [Activity] = [Activity]()
    var updateMenu: (()->())?
    
    var menu: [Menu] = [Menu]() {
        didSet {
            self.updateMenu?()
        }
    }
    
    func loadData() {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!

        let jsonData = try! Data(contentsOf: url)
        let data = try! JSONDecoder().decode(Level.self, from: jsonData)
        
        levels = data.levels
        menu = data.menu
//        levels = data.levels.map { (activity) in
//            var newActivity = Activity()
//            newActivity = activity
//
//            let random = generateRandomObject(except: activity.image1)
//            if activity.image2 == "random" {
//                newActivity.image2 = random
//            } else if activity.image3 == "random" {
//                newActivity.image3 = random
//            } else {
//                return activity
//            }
//
//            return newActivity
//        }
    }
    
    func filterBy(level: Int) -> [Activity] {
        return self.levels.filter { $0.level == level }
    }
    
//    func generateRandomObject(except: String) -> String {
//        return objects.filter { $0 != except }.randomElement()!
//    }
}
