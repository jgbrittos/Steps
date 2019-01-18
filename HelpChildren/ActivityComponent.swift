//
//  ActivityView.swift
//  HelpChildren
//
//  Created by João Gabriel on 03/12/18.
//  Copyright © 2018 João Gabriel de Britto e Silva. All rights reserved.
//

import UIKit
import AVFoundation

class ActivityComponent: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var audioProgressBar: UIProgressView!
    @IBOutlet weak var audioIndicatorImageView: UIImageView!
    @IBOutlet weak var playAudioButton: UIButton!
    
    var player = AVAudioPlayer()
    var audio: String = ""
    
    class func instanceFromNib() -> ActivityComponent {
        guard let card = UINib(nibName: "ActivityComponent", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? ActivityComponent else {
            return ActivityComponent()
        }
        
        return card
    }
    
    override func draw(_ rect: CGRect) {
//        self.topView.round(corners: [.topLeft, .topRight])
//        self.bottomView.round(corners: [.bottomLeft, .bottomRight])
//        self.layer.shadowOffset = CGSize.zero
//        self.layer.shadowRadius = 5
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.2
//        self.downloadLabel.isHidden = false
//        self.downloadQuotationPDFButton.isHidden = false
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func set(image: UIImage) {
        self.imageView.image = image
    }

    func setAudio(progress: Float) {
        self.audioProgressBar.setProgress(progress, animated: true)
    }

    func setAudioIndicator(_ hide: Bool) {
        self.audioIndicatorImageView.isHidden = !hide
    }
    
    func setAudio(_ name: String) {
        self.audio = name
    }
    
    @IBAction func playAudio(_ sender: Any) {
        print("PLAYING AUDIO")
        playAudioFile(withName: audio)
    }
    
    func playAudioFile(withName name: String) {

        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("couldn't load file :(")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAudioProgressBar), userInfo: nil, repeats: true)            
        } catch let error {
            print(error.localizedDescription)
        }

        player.play()
        
    }
    
    @objc func updateAudioProgressBar() {
        audioProgressBar.setProgress(player.isPlaying ? Float(player.currentTime/player.duration) : 0, animated: false)
    }
}
