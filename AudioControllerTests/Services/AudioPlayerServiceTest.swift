//
//  AudioPlayerServiceTest.swift
//  AudioControllerTests
//
//  Created by Admin on 13/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

@testable import AudioController
import XCTest
import AVFoundation

class AudioPlayerServiceTest: XCTestCase {
    
    var audioPlayerService: AudioPlayerService!
    
    override func setUp() {
        super.setUp()
        audioPlayerService = AudioPlayerService(audioSession: AVAudioSession.sharedInstance())
    }

    func testRecordAndPlay() {
        let recordSettings: [String : Any] = [AVFormatIDKey:kAudioFormatAppleLossless,
                                              AVSampleRateKey:44100.0,
                                              AVNumberOfChannelsKey:2]
        
        let audioPlayerSettings = AudioPlayerSettings(recorderSettings: recordSettings,
                                                      fileUrlPath: self.getRecordingUrl())
            
        self.audioPlayerService.recordWith(settings: audioPlayerSettings)
        XCTAssertTrue(self.audioPlayerService.isRecording)
        XCTAssertFalse(self.audioPlayerService.isPlaying)
        self.audioPlayerService.stopRecord()

        self.audioPlayerService.playWith(url: self.getRecordingUrl())
        XCTAssertTrue(self.audioPlayerService.isPlaying)
        XCTAssertFalse(self.audioPlayerService.isRecording)
        self.audioPlayerService.stopPlay()
    }
    
//MARK: - private
    fileprivate func getRecordingUrl () -> URL {
        let path = IOFileAdapter().getDocumentDirectoryPath().appending("/testAudio.m4a")
        let url = URL(fileURLWithPath:path)
        return url
    }
}

