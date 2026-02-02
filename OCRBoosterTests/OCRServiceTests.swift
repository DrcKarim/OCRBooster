//
//  OCRServiceTests.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import XCTest
@testable import OCRBooster

final class OCRServiceTests: XCTestCase {

    private var service: OCRService!

    override func setUp() {
        super.setUp()
        service = OCRService()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testExtractText_withInvalidImage_returnsError() {
        let expectation = XCTestExpectation(description: "OCR error")

        let invalidImage = NSImage(size: .zero)

        service.extractText(from: invalidImage) { result in
            XCTAssertFalse(result.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2)
    }
}
