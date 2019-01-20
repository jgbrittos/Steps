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
    @IBOutlet weak var component1: UIView!
    @IBOutlet weak var component2: UIView!
    @IBOutlet weak var component3: UIView!
    @IBOutlet weak var previousActivityButton: UIButton!
    @IBOutlet weak var nextActivityButton: UIButton!
    @IBOutlet weak var questionOrderLabel: UILabel!
    
    lazy var viewModel: ActivityViewModel = {
        return ActivityViewModel()
    }()
    
//    var activities: [Activity]!
    var totalQuestions = 20
    var question = 1
    let c1 = ActivityComponent.instanceFromNib()
    let c2 = ActivityComponent.instanceFromNib()
    let c3 = ActivityComponent.instanceFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
        initVM()
    }
    
    func initComponents() {
        c1.frame = CGRect(x: 0, y: 0, width: component1.frame.width, height: component1.frame.height)
        component1.addSubview(c1)
        
        c2.frame = CGRect(x: 0, y: 0, width: component2.frame.width, height: component2.frame.height)
        component2.addSubview(c2)
        
        c3.frame = CGRect(x: 0, y: 0, width: component3.frame.width, height: component3.frame.height)
        component3.addSubview(c3)
    }
    
    func initVM() {
        title = viewModel.title
        viewModel.titleLevel = viewModel.title
        totalQuestions = viewModel.activities.count
        
        viewModel.updateActivity = { [weak self] () in
            DispatchQueue.main.async {
                self?.setupComponentsActivity(with: self!.viewModel.activity)
            }
        }
        
        viewModel.controlNextButtonVisibility = { [weak self] () in
            DispatchQueue.main.async {
                self?.nextActivityButton.isHidden = self?.question == self!.totalQuestions
            }
        }
        
        viewModel.controlPreviousButtonVisibility = { [weak self] () in
            DispatchQueue.main.async {
                self?.previousActivityButton.isHidden = self?.question == 1
            }
        }
    
        updateActivityBy(order: 1)
    }
    
    func setupComponentsActivity(with activity: Activity) {
        c1.set(image: UIImage(named: activity.image1) ?? #imageLiteral(resourceName: "no_image"))
        c1.setAudio(activity.audio1)
        
        c2.set(image: UIImage(named: activity.image2) ?? #imageLiteral(resourceName: "no_image"))
        c2.setAudio(activity.audio2)
        
        c3.set(image: UIImage(named: activity.image3) ?? #imageLiteral(resourceName: "no_image"))
        c3.setAudio(activity.audio3)
    }
    
    @IBAction func previousQuestion(_ sender: Any) {
        question -= 1
        updateActivityBy(order: question)
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        question += 1
        updateActivityBy(order: question)
    }
    
    private func updateActivityBy(order: Int) {
        questionOrderLabel.text = "\(question)/\(totalQuestions)"
        viewModel.currentQuestionOrder = question
        viewModel.getActivityBy(order: order)
    }
}
