# OCRBooster

A macOS application built with SwiftUI that extracts text from images using Apple's Vision framework for optical character recognition (OCR).

## Overview

OCRBooster provides a clean, modern interface for performing OCR on images. The application features a glassmorphic UI design with a two-panel layout: one for image preview and selection, and another for displaying extracted text results.

## Features

- **Image Upload**: Select images from your local file system using a native file picker
- **OCR Processing**: Extract text from images using Apple's Vision framework with high accuracy
- **Real-time Results**: View extracted text immediately after processing
- **Modern UI**: Glassmorphic design with visual effects and gradient backgrounds
- **Firebase Integration**: Analytics and crash reporting capabilities

## Technical Stack

- **Language**: Swift 5.0
- **Framework**: SwiftUI
- **Platform**: macOS 15.7+
- **OCR Engine**: Apple Vision Framework
- **Analytics**: Firebase Analytics
- **Crash Reporting**: Firebase Crashlytics

## Project Structure

```
OCRBooster/
├── Models/
│   └── OCRResult.swift           # Data model for OCR results
├── Views/
│   └── ContentView.swift         # Main application view
├── ViewModels/
│   └── OCRViewModel.swift        # Business logic and state management
├── Services/
│   ├── OCRService.swift          # OCR processing implementation
│   └── OCRServiceProtocol.swift  # Service abstraction
├── UIComponents/
│   ├── AppBackground.swift       # Gradient background component
│   ├── GlassCard.swift          # Glassmorphic card component
│   └── VisualEffectView.swift   # Native visual effect wrapper
├── Utilities/
│   └── ImagePicker.swift         # File picker utility
├── Resources/
│   └── Assets.xcassets/         # App icons and assets
└── OCRBoosterTests/
    ├── OCRServiceTests.swift     # Service layer tests
    ├── OCRViewModelTests.swift   # ViewModel tests
    └── MockOCRService.swift      # Mock service for testing
```

## Architecture

The application follows the MVVM (Model-View-ViewModel) architectural pattern:

- **Models**: Define data structures for OCR results
- **Views**: SwiftUI views for the user interface
- **ViewModels**: Handle business logic and state management
- **Services**: Encapsulate OCR processing logic with protocol-oriented design

## Getting Started

### Prerequisites

- macOS 15.7 or later
- Xcode 26.0 or later
- Apple Developer account (for code signing)

### Installation

1. Clone the repository
2. Open `OCRBooster.xcodeproj` in Xcode
3. Build and run the project

## Testing

The project includes comprehensive unit tests:

- **OCRServiceTests**: Tests for the OCR service implementation
- **OCRViewModelTests**: Tests for the view model logic
- **MockOCRService**: Mock implementation for isolated testing

Run tests using Xcode's test navigator or the command line:

```bash
xcodebuild test -scheme OCRBooster -destination 'platform=macOS'
```

## Continuous Integration

GitHub Actions workflow is configured to build the project automatically on push to the main branch or pull requests. The CI pipeline:

- Runs on macOS latest
- Uses Xcode for building
- Builds without code signing for CI environment

The workflow file is located at `.github/workflows/ci.yml` and runs on:
- Push to the `main` branch
- Pull requests to any branch

## Security Features

- App Sandbox enabled for enhanced security
- Hardened Runtime protection
- User-selected file access restricted to read-only
- Secure file picker implementation

## Development Team

Development Team ID: 9994G9A7AV

## License

Copyright 2026. All rights reserved.

## Author

Created by Karim Bouchaane on 01/02/2026
```
