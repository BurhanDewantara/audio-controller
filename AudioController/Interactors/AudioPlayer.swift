//
//  AudioPlayer.swift
//  AudioController
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import Foundation
import AVFoundation

protocol AudioPlayerProtocol  {
    func record()
    func stopRecord()
    func play()
    func stopPlay()
}

class AudioPlayer: AudioPlayerProtocol {

    fileprivate let audioPlayerService:AudioPlayerServiceProtocol!
    fileprivate let fileAdapter:IOFileAdapterProtocol!
    
    init(audioPlayerService: AudioPlayerServiceProtocol, fileAdapter :IOFileAdapterProtocol) {
        self.audioPlayerService = audioPlayerService
        self.fileAdapter = fileAdapter
    }
    
    func record() {
        let recorderSettings: [String : Any] = [AVFormatIDKey:kAudioFormatAppleLossless,
                                                AVSampleRateKey:44100.0,
                                                AVNumberOfChannelsKey:2]
        let fileUrlPath = getFileUrlPath(fileName: "audio.m4a")
        let audioPlayerSettings = AudioPlayerSettings(recorderSettings: recorderSettings,
                                                      fileUrlPath:fileUrlPath)
        
        self.audioPlayerService.recordWith(settings: audioPlayerSettings)
    }
    
    func stopRecord() {
        self.audioPlayerService.stopRecord()
    }
    
    func play() {
        let fileUrlPath = getFileUrlPath(fileName: "audio.m4a")
        self.audioPlayerService.playWith(url: fileUrlPath)
    }
    
    func stopPlay(){
        self.audioPlayerService.stopPlay()
    }

    //MARK: - private
    fileprivate func getFileUrlPath(fileName: String) -> URL {
        guard let fileAdapter = self.fileAdapter else { return URL(fileURLWithPath: "") }
        let urlPath = fileAdapter.getDocumentDirectoryPath().appending("/\(fileName)")
        return URL(fileURLWithPath: urlPath)
    }
}
