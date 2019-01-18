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
    
    lazy var viewModel: LevelViewModel = {
        return LevelViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
        
        initVM()
    }

    func initVM() {
        viewModel.updateMenu = { [weak self] () in
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
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCollectionViewCell
        
        cell.setup(with: viewModel.menu[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
}
