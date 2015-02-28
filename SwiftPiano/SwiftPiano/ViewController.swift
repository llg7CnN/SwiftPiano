//
//  ViewController.swift
//  SwiftPiano
//
//  Created by 佐々木優翔 on 2015/02/28.
//  Copyright (c) 2015年 Yuto Sasaki. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let pianoKeys = ["C3", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C4"]
    var audioPlayers:[AVAudioPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for key in pianoKeys {
            let pianoSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(key, ofType: "mp3")!)
            let audioPlayer = AVAudioPlayer(contentsOfURL: pianoSoundURL, error: nil)
            audioPlayer.prepareToPlay()
            audioPlayers.append(audioPlayer)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playKey(sender: UIButton) {
        let keynum = sender.tag
        audioPlayers[keynum].currentTime = 0
        audioPlayers[keynum].play()
    }
    
}
