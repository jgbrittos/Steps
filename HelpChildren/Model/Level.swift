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
    var levels: [Activity]!
    
    init() {}
}

extension Level: CustomStringConvertible {
    var description: String {
        return "{\n\tlevels: \(levels.count)\n}"
    }
}
