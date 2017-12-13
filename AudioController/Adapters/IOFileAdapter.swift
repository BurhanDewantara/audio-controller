//
//  IOFileAdapter.swift
//  AudioController
//
//  Created by Admin on 19/11/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

import UIKit

protocol IOFileAdapterProtocol {
    func getDocumentDirectoryPath() -> String
}

class IOFileAdapter: IOFileAdapterProtocol {
    func getDocumentDirectoryPath() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                        .userDomainMask,
                                                        true)

        guard let lastPath = path.last else { return "" }
        return lastPath
    }

}
