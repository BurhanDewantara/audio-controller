//
//  AudioPlayerTest.swift
//  AudioControllerTests
//
//  Created by Admin on 12/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

@testable import AudioController
import XCTest

class AudioPlayerTest: XCTestCase {
    var audioPlayerServiceMock: AudioPlayerServiceMock!
    var fileAdapter: IOFileAdapterMock!
    var audioPlayer: AudioPlayer!

    override func setUp() {
        super.setUp()
        audioPlayerServiceMock = AudioPlayerServiceMock()
        fileAdapter = IOFileAdapterMock()
        audioPlayer = AudioPlayer(audioPlayerService: audioPlayerServiceMock ,
                                  fileAdapter: fileAdapter)
    }

    func testRecord () {
        audioPlayer.record()
        XCTAssertTrue(audioPlayerServiceMock.isRecording)
        XCTAssertTrue(audioPlayerServiceMock.hasCalled["recordWith"] ?? false)
        XCTAssertTrue(fileAdapter.hasCalled["getDocumentDirectoryPath"] ?? false)

    }

    func testStopRecord() {
        audioPlayer.stopRecord()
        XCTAssertFalse(audioPlayerServiceMock.isRecording)
        XCTAssertTrue(audioPlayerServiceMock.hasCalled["stopRecord"] ?? false)
    }

    func testPlay() {
        audioPlayer.play()
        XCTAssertTrue(audioPlayerServiceMock.isPlaying)
        XCTAssertTrue(audioPlayerServiceMock.hasCalled["playWith"] ?? false)
        XCTAssertTrue(fileAdapter.hasCalled["getDocumentDirectoryPath"] ?? false)
    }
    
    func testStopPlay() {
        audioPlayer.stopPlay()
        XCTAssertFalse(audioPlayerServiceMock.isPlaying)
        XCTAssertTrue(audioPlayerServiceMock.hasCalled["stopPlay"] ?? false)
    }

}

