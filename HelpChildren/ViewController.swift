//
//  ViewController.swift
//  HelpChildren
//
//  Created by João Gabriel on 03/12/18.
//  Copyright © 2018 João Gabriel de Britto e Silva. All rights reserved.
//

import UIKit

let START_ACTIVITY_SEGUE = "StartActivitySegue"

class ViewController: UIViewController {
    @IBOutlet weak var levelsCollectionView: UICollectionView!
    @IBOutlet weak var trainingButton: UIButton!
    
    lazy var viewModel: LevelViewModel = {
        return LevelViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
        
        self.trainingButton.layer.masksToBounds = false
        self.trainingButton.layer.shadowRadius = 5
        self.trainingButton.layer.shadowOpacity = 0.2
        self.trainingButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        initVM()
    }

    func initVM() {
        
        viewModel.updateLevelsList = { [weak self] () in
            DispatchQueue.main.async {
                self?.levelsCollectionView.reloadData()
            }
        }
        
        viewModel.loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == START_ACTIVITY_SEGUE {
            let vc = segue.destination as! ActivityViewController
            vc.viewModel.activities = viewModel.filterBy(level: sender as? Int ?? 0)
        }
    }
    
    @IBAction func startTraining(_ sender: Any) {
        self.performSegue(withIdentifier: START_ACTIVITY_SEGUE, sender: 0)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCollectionViewCell
        let menu = viewModel.menu[indexPath.row]
        cell.levelImage.image = UIImage(named: menu.image)
        cell.levelLabel.text = menu.levelDescription
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        self.performSegue(withIdentifier: START_ACTIVITY_SEGUE, sender: indexPath.row)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 4.5
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25.0
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5.0
//    }
}
