//
//  ActivityViewController.swift
//  HelpChildren
//
//  Created by João Gabriel on 03/12/18.
//  Copyright © 2018 João Gabriel de Britto e Silva. All rights reserved.
//

import UIKit
import AVFoundation

class ActivityViewController: UIViewController {

    var level: Int?
    
    @IBOutlet weak var component1: UIView!
    @IBOutlet weak var component2: UIView!
    @IBOutlet weak var component3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "10/60"

        let c1 = ActivityComponent.instanceFromNib()
        c1.set(image: UIImage(named:"dog")!)
        c1.setAudio(progress: 0)
        c1.setAudioIndicator(false)
        c1.frame = CGRect(x: 0, y: 0, width: component1.frame.width, height: component1.frame.height)
        component1.addSubview(c1)
        
        let c2 = ActivityComponent.instanceFromNib()
        c2.set(image: UIImage(named:"dog")!)
        c2.setAudio(progress: 1)
        c2.setAudioIndicator(false)
        c2.frame = CGRect(x: 0, y: 0, width: component2.frame.width, height: component2.frame.height)
        component2.addSubview(c2)
        
        let c3 = ActivityComponent.instanceFromNib()
        c3.set(image: UIImage(named:"dog")!)
        c3.setAudio(progress: 0.5)
        c3.setAudioIndicator(false)
        c3.frame = CGRect(x: 0, y: 0, width: component3.frame.width, height: component3.frame.height)
        component3.addSubview(c3)
    }
}
