//
//  ViewController.swift
//  Xylophone
//
//  Created by Karthik Chowdary on 27/12/2017.
//  Copyright © 2017 Karthik Chowdary. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController{
    var player:AVAudioPlayer?
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"];
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        playSound(selectedSound: soundArray[sender.tag - 1]);
    }
    
    func playSound(selectedSound : String){
        let url = Bundle.main.url(forResource: selectedSound, withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
  

}

