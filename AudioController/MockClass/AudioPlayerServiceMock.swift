//
//  AudioPlayerServiceMock.swift
//  AudioController
//
//  Created by Admin on 11/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import Foundation

class AudioPlayerServiceMock: AudioPlayerServiceProtocol {
    var hasCalled = Dictionary<String,Bool>()
    var audioPlayerSettings: AudioPlayerSettings?
    var fileUrlPath: URL?
    var isRecording: Bool
    var isPlaying: Bool
    
    init() {
        isRecording = false
        isPlaying = false
    }
    
    func playWith(url fileUrlPath: URL) {
        self.fileUrlPath = fileUrlPath
        hasCalled["playWith"] = true
        isPlaying = true
    }
    
    func recordWith(settings audioPlayerSettings: AudioPlayerSettings) {
        self.audioPlayerSettings = audioPlayerSettings
        hasCalled["recordWith"] = true
        isRecording = true
    }
    
    func stopPlay() {
        hasCalled["stopPlay"] = true
        isPlaying = false
    }
    
    func stopRecord() {
        hasCalled["stopRecord"] = true
        isRecording = false
    }
    
}
