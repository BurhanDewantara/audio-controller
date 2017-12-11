//
//  AudioPlayerServiceSpec.swift
//  AudioControllerTests
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

@testable import AudioController
import Nimble
import Quick
import AVFoundation

class AudioPlayerServiceSpec: QuickSpec {
    
    override func spec() {
        context("AudioPlayerService Spec") {
            var audioPlayerService:AudioPlayerServiceProtocol!
            var audioSession:AVAudioSession!
            
            beforeEach {
                audioSession = AVAudioSession.sharedInstance()
                audioPlayerService = AudioPlayerService(audioSession: audioSession)
            }
            
            afterEach {
                audioSession = nil
                audioPlayerService = nil
            }
            
            describe("record with setting") {
                fit("will setup AVAudiorecorder and record") {
                    let recorderSettings: [String : Any] = [AVFormatIDKey:kAudioFormatAppleLossless,
                                                            AVSampleRateKey:44100.0,
                                                            AVNumberOfChannelsKey:2]
                    
                    var path = IOFileAdapter().getDocumentDirectoryPath()
                    path = path.appending("/asd.m4a")
                    let url = URL(fileURLWithPath:path)
                    
                    let settings = AudioPlayerSettings(recorderSettings: recorderSettings,
                                                       fileUrlPath: url)
                    audioPlayerService.recordWith(audioPlayerSettings: settings)
                    expect(audioPlayerService.isRecording).to(beTrue())
                }
            }
            describe("play with Setting") {
                fit("will setup AVAudioPlayer and play") {
                    
                    var path = IOFileAdapter().getDocumentDirectoryPath()
                    path = path.appending("/asd.m4a")
                    let url = URL(fileURLWithPath:path)
                    
                    let settings = AudioPlayerSettings(recorderSettings: [String:Any](),
                                                       fileUrlPath: url)
                    audioPlayerService.playWith(audioPlayerSettings: settings)
                    expect(audioPlayerService.isPlaying).to(beTrue())
                }
            }
            
        }
        
    }
}
