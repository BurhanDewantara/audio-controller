//
//  AudioPlayerService.swift
//  AudioController
//
//  Created by Admin on 19/11/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import UIKit
import AVFoundation

protocol AudioPlayerServiceProtocol {
    func recordWith(audioPlayerSettings: AudioPlayerSettings)
    func playWith(audioPlayerSettings: AudioPlayerSettings)
    func stopRecord()
    func stopPlay()
    var isPlaying: Bool { get }
    var isRecording: Bool { get }
}

class AudioPlayerService: AudioPlayerServiceProtocol {

    fileprivate let audioSession:AVAudioSession
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var isPlaying: Bool {
        guard let audioPlayer = self.audioPlayer else {
            return false
        }
        return audioPlayer.isPlaying
    }
    
    var isRecording: Bool {
        guard let audioRecorder = self.audioRecorder else {
            return false
        }
        return audioRecorder.isRecording
    }
    
    
    init(audioSession: AVAudioSession) {
        self.audioSession = audioSession
    }
    
    //MARK: - private
    func recordWith(audioPlayerSettings : AudioPlayerSettings)
    {
        setSession(category: AVAudioSessionCategoryRecord)
        guard let settings = audioPlayerSettings.recorderSettings,
            let path = audioPlayerSettings.fileUrlPath
            else { return }

        prepareRecorder(recorderSetting: settings, fileUrlPath: path)
        guard let audioRecorder = self.audioRecorder else { return }
        
        audioRecorder.record()
        
    }
    
    func stopRecord() {
        guard let audioRecorder = audioRecorder else { return }
        try? self.audioSession.setActive(false)
        audioRecorder.stop()
    }
    
    func playWith(audioPlayerSettings : AudioPlayerSettings)
    {
        setSession(category: AVAudioSessionCategoryPlayback)
        guard let path = audioPlayerSettings.fileUrlPath else { return }

        preparePlayer(fileUrlPath: path)
        guard let audioPlayer = self.audioPlayer else { return }
        
        audioPlayer.play()
    }
    
    func stopPlay() {
        guard let audioPlayer = audioPlayer else { return }
        try? self.audioSession.setActive(false)
        audioPlayer.stop()
    }
    
    //MARK: - private
    fileprivate func setSession(category:String) {
        try? self.audioSession.setCategory(category)
        try? self.audioSession.setActive(true)
    }
    
    fileprivate func preparePlayer(fileUrlPath: URL) {
        self.audioPlayer = try? AVAudioPlayer(contentsOf: fileUrlPath)
        guard let audioPlayer = self.audioPlayer else { return }
        audioPlayer.volume = 1.0
        audioPlayer.prepareToPlay()
    }
    
    fileprivate func prepareRecorder (recorderSetting:[String:Any], fileUrlPath: URL) {
        self.audioRecorder = try? AVAudioRecorder(url:fileUrlPath , settings: recorderSetting)
        guard let audioRecorder = self.audioRecorder else { return }
        audioRecorder.prepareToRecord()
    }
}
