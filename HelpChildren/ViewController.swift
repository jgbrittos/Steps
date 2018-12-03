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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == START_ACTIVITY_SEGUE {
            let vc = segue.destination as! ActivityViewController
            vc.level = sender as? Int ?? 0
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCollectionViewCell
        cell.levelImage.image = UIImage(named: "dog")
        cell.levelLabel.text = "Nível \(indexPath.row + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        self.performSegue(withIdentifier: START_ACTIVITY_SEGUE, sender: indexPath.row)
    }
    

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
//        let CellWidth = 200
//        let CellCount = 8
//        let collectionViewWidth = collectionView.frame.size.width
//        let CellSpacing = 10
//
//        let totalCellWidth = CellWidth * CellCount
//        let totalSpacingWidth = CellSpacing * (CellCount - 1)
//
//        let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
//        let rightInset = leftInset
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
