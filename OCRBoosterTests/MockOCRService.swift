//
//  MockOCRService.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import AppKit
@testable import OCRBooster

class MockOCRService: OCRServiceProtocol {

    var resultToReturn: String = ""

    func extractText(from image: NSImage, completion: @escaping (String) -> Void) {
        completion(resultToReturn)
    }
}
