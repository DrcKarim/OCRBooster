//
//  OCRResult.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import Foundation

struct OCRResult: Identifiable {

    let id = UUID()

    let text: String
    let createdAt: Date
    let sourceName: String?
}
