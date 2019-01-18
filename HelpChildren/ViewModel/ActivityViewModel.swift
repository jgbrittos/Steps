//
//  ActivityViewModel.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class ActivityViewModel {
    
    var updateActivity: (()->())?
    var controlPreviousButtonVisibility: (()->())?
    var controlNextButtonVisibility: (()->())?
    
    var activities: [Activity] = [Activity]()
    
    var activity: Activity = Activity() {
        didSet {
            updateActivity?()
        }
    }
    
    var currentQuestionOrder: Int = 1 {
        didSet {
            controlPreviousButtonVisibility?()
            controlNextButtonVisibility?()
        }
    }
    
    func getActivityBy(order: Int) {
         activity = activities[order - 1]
    }
}
