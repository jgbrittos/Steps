//
//  Activity.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class Activity: Codable {
    var level: Int!
    var order: Int!
    var image1: String!
    var image2: String!
    var image3: String!
    var audio1: String!
    var audio2: String!
    var audio3: String!
    
    init() {}
}

extension Activity: CustomStringConvertible {
    var description: String {
        return "level: \(String(describing: level))"
    }
}
