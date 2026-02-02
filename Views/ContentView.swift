//
//  ContentView.swift
//  OCRBooster
//
//  Created by Karim Bouchaane on 01/02/2026.
//

import SwiftUI
import FirebaseCrashlytics

struct ContentView: View {
    @StateObject private var viewModel = OCRViewModel()

    var body: some View {
        ZStack {
            AppBackground()

            HStack(spacing: 20) {

                // LEFT PANEL (image preview)
                GlassCard {
                    VStack {
                        if let image = viewModel.selectedImage {
                            Image(nsImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 300)
                        } else {
                            Text("No image selected")
                                .foregroundColor(.secondary)
                        }

                        Button("Upload Image") {
                            ImagePicker.pickImage { image in
                                viewModel.selectedImage = image
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .frame(width: 320)

                // RIGHT PANEL (OCR result)
                GlassCard {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("OCR Result")
                                .font(.headline)

                            Spacer()

                            if viewModel.isLoading {
                                ProgressView()
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {

                            if let result = viewModel.result {
                                Text("Created: \(result.createdAt.formatted())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                TextEditor(text: .constant(result.text))
                                    .frame(minHeight: 300)
                            } else {
                                TextEditor(text: .constant("Upload an image to start OCR"))
                                    .foregroundColor(.secondary)
                                    .frame(minHeight: 300)
                            }
                        }

                        Button("Extract Text") {
                            viewModel.extractText()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.selectedImage == nil || viewModel.isLoading)
                    }
                }
            }
            .padding(24)
        }
    }
}


#Preview {
    ContentView()
}
