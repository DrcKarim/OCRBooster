//
//  ImagePicker.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import SwiftUI
import AppKit
import UniformTypeIdentifiers

struct ImagePicker {

    static func pickImage(completion: @escaping (NSImage?) -> Void) {

        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.image]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false

        panel.begin { response in
            if response == .OK, let url = panel.url {
                let image = NSImage(contentsOf: url)
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
}
