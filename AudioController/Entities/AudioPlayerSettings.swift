//
//  AudioPlayerSettings.swift
//  AudioController
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import Foundation

class AudioPlayerSettings {
    let recorderSettings: [String: Any]?
    let fileUrlPath: URL?
    
    init(recorderSettings: [String : Any], fileUrlPath : URL) {
        self.recorderSettings = recorderSettings
        self.fileUrlPath = fileUrlPath
    }
}
