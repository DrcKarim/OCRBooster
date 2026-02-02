//
//  OCRService.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import Foundation
import Vision
import AppKit


final class OCRService {

    /// Extract text from an NSImage using Apple Vision
    func extractText(from image: NSImage,
                     completion: @escaping (String) -> Void) {

        // 1️⃣ Convert NSImage → CGImage (Vision works with CGImage)
        guard let cgImage = image.cgImage(forProposedRect: nil,
                                          context: nil,
                                          hints: nil) else {
            completion("Failed to read image.")
            return
        }

        // 2️⃣ Create a Vision OCR request
        let request = VNRecognizeTextRequest { request, error in

            // 3️⃣ Handle errors
            if let error = error {
                completion("OCR Error: \(error.localizedDescription)")
                return
            }

            // 4️⃣ Collect recognized text
            let observations = request.results as? [VNRecognizedTextObservation] ?? []
            let finalText = observations
                .compactMap { $0.topCandidates(1).first?.string }
                .joined(separator: "\n")

            // 5️⃣ Return result
            completion(finalText.isEmpty ? "No text detected." : finalText)
        }

        // 6️⃣ Configure OCR quality
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true

        // 7️⃣ Create request handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])

        // 8️⃣ Run OCR in background
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                completion("Failed to perform OCR.")
            }
        }
    }
}

extension OCRService: OCRServiceProtocol {}
