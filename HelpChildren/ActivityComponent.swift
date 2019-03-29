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
    
    private var player = AVAudioPlayer()
    private var audio: String = ""
    private var timer: Timer!
    
    class func instanceFromNib() -> ActivityComponent {
        guard let card = UINib(nibName: "ActivityComponent", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? ActivityComponent else {
            return ActivityComponent()
        }
        
        return card
    }
    
    override func draw(_ rect: CGRect) {
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
        guard !audio.isEmpty else { return }
        print(audio)
        playAudioFile(withName: audio)
    }
    
    private func playAudioFile(withName name: String) {
        NotificationCenter.default.post(name: .playingAudio, object: nil, userInfo: ["userInteractionEnabled": false])
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("couldn't load file :(")
            audioProgressBar.isHidden = true
            return
        }
        
        audioProgressBar.isHidden = false

        do {
            player = try AVAudioPlayer(contentsOf: url)
            setupTimer()
        } catch let error {
            print(error.localizedDescription)
        }

        player.play()
    }
    
    private func setupTimer() {        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(updateAudioProgressBar),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func updateAudioProgressBar() {
        audioProgressBar.isHidden = !player.isPlaying
        
        if player.isPlaying {
            audioProgressBar.setProgress(Float(player.currentTime/player.duration), animated: false)
        } else {
            if timer != nil {
                timer.invalidate()
                timer = nil
            }
            
            NotificationCenter.default.post(name: .playingAudio, object: nil, userInfo: ["userInteractionEnabled": true])
            audioProgressBar.setProgress(0, animated: false)
        }
    }
}
