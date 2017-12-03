//
//  AudioService.swift
//  AudioController
//
//  Created by Admin on 19/11/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import UIKit
import AVFoundation

class AudioService: NSObject {

    var audioPlayer:AVAudioPlayer?
    var ioFileAdapter:IOFileAdapter!
    
    func setupPlayer () {
//        try audioPlayer = AVAudioPlayer(contentsOf: getFileUrl())
//        audioPlayer?.delegate = self
//        audioPlayer?.prepareToPlay()
//        audioPlayer?.volume = 1.0
    }
    
}
