//
//  LevelViewModel.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class LevelViewModel {
    func loadData() {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(Level.self, from: jsonData)
            
            print(json)
        } catch {
            print(error)
        }
    }
}
