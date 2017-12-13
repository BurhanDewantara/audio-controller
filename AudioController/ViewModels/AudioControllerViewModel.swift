//
//  AudioControllerViewModel.swift
//  AudioController
//
//  Created by Admin on 11/11/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import UIKit
import AVFoundation

class AudioControllerViewModel {
    fileprivate let audioPlayer:AudioPlayerProtocol!
    
    class func create () -> AudioControllerViewModel {
        let audioPlayerService = AudioPlayerService(audioSession: AVAudioSession.sharedInstance())
        let fileAdapter = IOFileAdapter()
        
        let audioPlayer = AudioPlayer(audioPlayerService: audioPlayerService,
                                      fileAdapter: fileAdapter)
        
        return AudioControllerViewModel(audioPlayer: audioPlayer)
    }
    
     init(audioPlayer: AudioPlayerProtocol) {
        self.audioPlayer = audioPlayer;
    }
    
    func recordButtonTapped() {
        self.audioPlayer.record()
    }
    
    func playButtonTapped() {
        self.audioPlayer.play()
    }
    
    func stopRecordButtonTapped() {
        self.audioPlayer.stopRecord()
    }
    
}
