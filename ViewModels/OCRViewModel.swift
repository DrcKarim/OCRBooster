//
//  OCRViewModel.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import SwiftUI
import Combine
import AppKit

class OCRViewModel: ObservableObject {

    @Published var selectedImage: NSImage?
    @Published var result: OCRResult?
    @Published var isLoading = false

    private let service: OCRServiceProtocol

    // ✅ Default + injectable initializer
    init(service: OCRServiceProtocol = OCRService()) {
        self.service = service
    }

    func extractText() {
        guard let image = selectedImage else {
            result = nil
            return
        }

        isLoading = true

        service.extractText(from: image) { [weak self] text in
            DispatchQueue.main.async {
                self?.result = OCRResult(
                    text: text,
                    createdAt: Date(),
                    sourceName: "Imported Image"
                )
                self?.isLoading = false
            }
        }
    }
}

 

//class OCRViewModel: ObservableObject {
//
//    @Published var selectedImage: NSImage?
//    @Published var extractedText = "Upload an image to start OCR"
//    @Published var isLoading = false
//
//    private let service: OCRServiceProtocol
//
//    init(service: OCRServiceProtocol = OCRService()) {
//        self.service = service
//    }
//
//    func extractText() {
//        guard let image = selectedImage else {
//            extractedText = "Please upload an image first"
//            return
//        }
//
//        isLoading = true
//        service.extractText(from: image) { [weak self] result in
//            DispatchQueue.main.async {
//                self?.extractedText = result
//                self?.isLoading = false
//            }
//        }
//    }
//}

