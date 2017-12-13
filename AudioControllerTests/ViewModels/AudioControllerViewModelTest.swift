//
//  AudioControllerViewModelTest.swift
//  AudioControllerTests
//
//  Created by Admin on 14/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

@testable import AudioController
import XCTest

class AudioControllerViewModelTest: XCTestCase {
    var viewModel: AudioControllerViewModel!
    var audioPlayer: AudioPlayerMock!
    
    override func setUp() {
        super.setUp()
        audioPlayer = AudioPlayerMock()
        viewModel = AudioControllerViewModel(audioPlayer: audioPlayer)
    }
    
    func testPlayButtonTapped () {
        viewModel.playButtonTapped()
        XCTAssertTrue(audioPlayer.hasCalled["play"] ?? false)
    }
    
    func testStopRecordButtonTapped () {
        viewModel.stopRecordButtonTapped()
        XCTAssertTrue(audioPlayer.hasCalled["stopRecord"] ?? false)
    }

    func testRecordButtonTapped () {
        viewModel.recordButtonTapped()
        XCTAssertTrue(audioPlayer.hasCalled["record"] ?? false)
    }

    
}

