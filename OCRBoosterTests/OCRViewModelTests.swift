//
//  OCRViewModelTests.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import XCTest
@testable import OCRBooster
import AppKit

final class OCRViewModelTests: XCTestCase {

    var viewModel: OCRViewModel!
    var mockService: MockOCRService!

    override func setUp() {
        super.setUp()
        mockService = MockOCRService()
        viewModel = OCRViewModel(service: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertNil(viewModel.selectedImage)
        XCTAssertNil(viewModel.result)
        XCTAssertFalse(viewModel.isLoading)
    }

    func testExtractTextWithoutImage() {
        viewModel.extractText()
        XCTAssertNil(viewModel.result)
        XCTAssertFalse(viewModel.isLoading)
    }

    func testExtractTextWithImage() {
        // GIVEN
        let dummyImage = NSImage(size: NSSize(width: 10, height: 10))
        viewModel.selectedImage = dummyImage
        mockService.resultToReturn = "Hello OCR"

        let expectation = XCTestExpectation(description: "OCR completion")

        // WHEN
        viewModel.extractText()

        // THEN
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNotNil(self.viewModel.result)
            XCTAssertEqual(self.viewModel.result?.text, "Hello OCR")
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}


