//
//  IOFileAdapterTest.swift
//  AudioControllerTests
//
//  Created by Admin on 14/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//

@testable import AudioController
import XCTest

class IOFileAdapterTest: XCTestCase {
    
    var fileAdapter:IOFileAdapter!
    override func setUp() {
        super.setUp()
        self.fileAdapter = IOFileAdapter()
    }
 
    func testGetDocumentFilePath () {
        guard let path = fileAdapter?.getDocumentDirectoryPath() else { return }
        XCTAssertNotNil(path)
        XCTAssertTrue(path.contains("Documents"))
    }
}

