//
//  AudioPlayerMock.swift
//  AudioController
//
//  Created by Admin on 14/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import Foundation

class AudioPlayerMock : AudioPlayerProtocol {
    var hasCalled = Dictionary<String,Bool>()
    
    func record() {
        hasCalled["record"] = true
    }
    func stopRecord() {
        hasCalled["stopRecord"] = true
    }
    func play() {
        hasCalled["play"] = true
    }
    func stopPlay() {
        hasCalled["stopPlay"] = true
    }

}
