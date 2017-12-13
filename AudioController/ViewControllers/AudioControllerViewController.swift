//
//  AudioControllerViewController.swift
//  AudioController
//
//  Created by Admin on 11/11/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import UIKit
import AVFoundation

class AudioControllerViewController: UIViewController {//, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioControllerViewModel:AudioControllerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    fileprivate func setupViewModel() {
        self.audioControllerViewModel = AudioControllerViewModel.create()
    }

    //MARK: - Actions
    @IBAction func stopButtonOnPressed(_ sender: UIButton) {
        self.audioControllerViewModel.stopRecordButtonTapped()
    }

    @IBAction func recordButtonOnPressed(_ sender: UIButton) {
        self.audioControllerViewModel.recordButtonTapped()
    }

    @IBAction func playButtonOnPressed(_ sender: UIButton) {
        self.audioControllerViewModel.playButtonTapped()
    }
}
