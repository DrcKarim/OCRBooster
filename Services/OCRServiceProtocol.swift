//
//  OCRServiceProtocol.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import AppKit


protocol OCRServiceProtocol {
    func extractText(from image: NSImage,
                     completion: @escaping (String) -> Void)
}
