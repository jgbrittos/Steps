//
//  Menu.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class Menu: Codable {
    var level: Int!
    var image: String!
    var levelDescription: String! {
        get {
            return level == 0 ? "Treinamento" : "Nível \(level ?? 0)"
        }
    }
    
    init() {}
}
