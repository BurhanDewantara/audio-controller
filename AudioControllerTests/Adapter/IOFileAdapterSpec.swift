//
//  IOFileAdapterSpec.swift
//  AudioControllerTests
//
//  Created by Admin on 02/12/17.
//  Copyright © 2017 newbeeCorp. All rights reserved.
//


@testable import AudioController
import Nimble
import Quick

class IOFileAdapterSpec: QuickSpec {
    override func spec() {
        context("IOFileAdapter") {
            var fileAdapter:IOFileAdapter!
            beforeEach {
                fileAdapter = IOFileAdapter()
            }
            afterEach {
                fileAdapter = nil
            }
            describe("getDocumentDirectoryPath") {
                it("should return file path"){
                    let path = fileAdapter?.getDocumentDirectoryPath()
                    expect(path).toNot(beEmpty())
                    expect(path).to(contain("Documents"))
                }
            }

        }
    }
    
    
}
