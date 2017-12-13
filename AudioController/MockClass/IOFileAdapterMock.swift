//
//  IOFileAdapterMock.swift
//  AudioController
//
//  Created by Admin on 11/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import Foundation

class IOFileAdapterMock: IOFileAdapterProtocol {
    var hasCalled = Dictionary<String,Bool>()
    func getDocumentDirectoryPath() -> String {
        hasCalled["getDocumentDirectoryPath"] = true
        return ""
    }
}
