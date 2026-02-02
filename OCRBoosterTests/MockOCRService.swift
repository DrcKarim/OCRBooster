//
//  MockOCRService.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import AppKit
@testable import OCRBooster

final class MockOCRService: OCRServiceProtocol {

    var resultToReturn = "Mock OCR Result"

    func extractText(from image: NSImage,
                     completion: @escaping (String) -> Void) {
        completion(resultToReturn)
    }
}
