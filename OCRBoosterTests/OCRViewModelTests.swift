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

    override func setUp() {
        super.setUp()
        viewModel = OCRViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    /// Tests the default state of the ViewModel
    func testInitialState() {
        XCTAssertNil(viewModel.selectedImage)
        XCTAssertNil(viewModel.result)
        XCTAssertFalse(viewModel.isLoading)
    }

    /// Tests calling extractText WITHOUT an image
    /// (should do nothing and not crash)
    func testExtractTextWithoutImage() {
        viewModel.extractText()

        XCTAssertNil(viewModel.result)
        XCTAssertFalse(viewModel.isLoading)
    }
}
