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
        XCTAssertEqual(viewModel.extractedText, "Upload an image to start OCR")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testExtractTextWithoutImage() {
        viewModel.extractText()
        XCTAssertEqual(viewModel.extractedText, "Please upload an image first")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testExtractTextWithImage() {
        let dummyImage = NSImage(size: NSSize(width: 10, height: 10))
        viewModel.selectedImage = dummyImage

        let expectation = XCTestExpectation(description: "OCR completion")

        mockService.resultToReturn = "Hello OCR"

        viewModel.extractText()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel.extractedText, "Hello OCR")
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
