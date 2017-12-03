//
//  AudioControllerViewController.swift
//  AudioController
//
//  Created by Admin on 11/11/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import UIKit
import AVFoundation

class AudioControllerViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
    }
    
    //MARK: - Actions
    @IBAction func stopButtonOnPressed(_ sender: UIButton) {
        guard let currentRecorder = self.audioRecorder else { return }
        stopRecord(recorder: currentRecorder)
    }
    
    @IBAction func recordButtonOnPressed(_ sender: UIButton) {
        setSessionToRecord()
        guard let currentRecorder = self.audioRecorder else { return }
        record(recorder: currentRecorder)
    }
    
    @IBAction func playButtonOnPressed(_ sender: UIButton) {
        setSessionToPlay()
        setupAudioPlayer()
        self.audioPlayer?.play()
    }
    
    //MARK: -
    
    func setupRecorder(){
        setSessionToRecord()
        prepareRecorder ()
    }
    
    func setSessionToRecord () {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord)
    }

    func getFileUrl (_ fileName:String) -> URL {
        let adapter = IOFileAdapter()
        let path = adapter.getDocumentDirectoryPath().appending(fileName)
        return URL(fileURLWithPath: path)
    }
    
    func prepareRecorder () {
        let recordSetting: [String : Any] = [AVFormatIDKey:kAudioFormatAppleLossless,
                                             AVSampleRateKey:44100.0,
                                             AVNumberOfChannelsKey:2]
        
        self.audioRecorder = try? AVAudioRecorder(url: getFileUrl("/audio.m4a"), settings: recordSetting)
        self.audioRecorder?.delegate = self
        self.audioRecorder?.prepareToRecord()
    }
    
    func record (recorder:AVAudioRecorder) {
        recorder.record()
    }
    
    func stopRecord (recorder:AVAudioRecorder) {
        recorder.stop()
    }
    
    func setSessionToPlay () {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    }
    
    func setupAudioPlayer() {
        self.audioPlayer = try? AVAudioPlayer(contentsOf: getFileUrl("/audio.m4a"))
        self.audioPlayer?.delegate = self
        self.audioPlayer?.prepareToPlay()
        self.audioPlayer?.volume = 1.0
    }

}
