//
//  AppBackground.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.4),
                    Color.cyan.opacity(0.3),
                    Color.teal.opacity(0.4)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VisualEffectView(
                material: .hudWindow,
                blendingMode: .behindWindow
            )
        }
        .ignoresSafeArea()
    }
}
