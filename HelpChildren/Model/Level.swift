//
//  Level.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class Level: Codable {
    var menu: [Menu]!
    var training: [Activity]!
    
    init() {}
}

extension Level: CustomStringConvertible {
    var description: String {
        return "{\n\tlevels: \(training.count)\n}"
    }
}

enum LevelNumber: Int {
    case training = 0
    case one, two, three, four, five, six, seven, eight, nine
}

enum LevelName: String {
    case training = "Treinamento"
    case other = ""
}
