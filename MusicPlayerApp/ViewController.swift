//
//  ViewController.swift
//  MusicPlayerApp
//
//  Created by ramjan sayyad on 24/02/15.
//  Copyright © 2015 ramjan sayyad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var SongNameTxt: UILabel!
    
    var timer = Timer()
    @IBOutlet weak var EndTimeTxt: UILabel!
    @IBOutlet weak var StartTimeTxt: UILabel!
    var player: AVAudioPlayer!
    @IBOutlet weak var StopBtn: UIButton!
    @IBOutlet weak var PauseBtn: UIButton!
    @IBOutlet weak var PlayBtn: UIButton!
    @IBOutlet weak var SongProgressSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "01 - Ok Jaanu - Title Song-(MyMp3Singer.net)", withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            let songDuration = player.duration /// 60
            StartTimeTxt.text = "0.00"
            EndTimeTxt.text = "\(String(format: "%.2f", songDuration))"
            
            SongProgressSlider.minimumValue = 0.0
            SongProgressSlider.maximumValue = Float(songDuration)
            SongProgressSlider.setValue(0.0, animated: true)
            
            guard let player = player else { return }
            player.prepareToPlay()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    @IBAction func Play(_ sender: Any) {
        
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.updateTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func updateTime(_ sender: Any) {
        
        let songCurrTime = player.currentTime /// 60
        print(songCurrTime)
        StartTimeTxt.text = "\(String(format: "%.2f", songCurrTime))"
        SongProgressSlider.setValue(Float(songCurrTime), animated: true)
        
        if(songCurrTime >= player.duration)
        {
            player.stop()
            timer.invalidate()
        }
    }
    @IBAction func SliderValueChanged(_ sender: Any) {
        
        let sliderTime = SongProgressSlider.value
        print(sliderTime)
        player.currentTime = TimeInterval(sliderTime)
        
    }
    
    
    
    @IBAction func Pause(_ sender: Any) {
        
        player.pause()
        timer.invalidate()
        
    }
    
    @IBAction func Stop(_ sender: Any) {
        player.stop()
        timer.invalidate()
        
        let url = Bundle.main.url(forResource: "01 - Ok Jaanu - Title Song-(MyMp3Singer.net)", withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            let songDuration = player.duration /// 60
            EndTimeTxt.text = "\(String(format: "%.2f", songDuration))"
            StartTimeTxt.text = "0.00"
            
            SongProgressSlider.minimumValue = 0.0
            SongProgressSlider.maximumValue = Float(songDuration)
            SongProgressSlider.setValue(0.0, animated: true)
            
            guard let player = player else { return }
            player.prepareToPlay()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

