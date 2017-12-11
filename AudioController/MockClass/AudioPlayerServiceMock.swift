//
//  AudioPlayerServiceMock.swift
//  AudioController
//
//  Created by Admin on 11/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import Foundation

class AudioPlayerServiceMock: AudioPlayerServiceProtocol {
    var audioPlayerSettings:AudioPlayerSettings?
    var hasBeenCalled = Dictionary<String,Any>()
    var isRecording: Bool
    var isPlaying: Bool
    
    init() {
        isRecording = false
        isPlaying = false
    }
    
    func playWith(audioPlayerSettings: AudioPlayerSettings) {
        self.audioPlayerSettings = audioPlayerSettings
        hasBeenCalled[#function] = true
        isPlaying = true
    }
    
    func recordWith(audioPlayerSettings: AudioPlayerSettings) {
        self.audioPlayerSettings = audioPlayerSettings
        hasBeenCalled[#function] = true
        isRecording = false
    }
    
    func stopPlay() {
        hasBeenCalled[#function] = true
        isPlaying = false
    }
    
    func stopRecord() {
        hasBeenCalled[#function] = true
        isRecording = false
    }
    
}
