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

    private let service = OCRService()

    func extractText() {
        guard let image = selectedImage else { return }

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


