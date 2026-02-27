# Imagine X - Infographic Generator

A powerful Flutter application that instantly transforms ideas and text prompts into beautiful, professional, and mobile-friendly infographics using Google's Gemini AI. The generated presentations can be directly exported to PDF or PPTX formats.

## 🌟 Features

*   **AI-Powered Generation**: Leverages Google Gemini AI to analyze raw text prompts and intelligently structure data into an organized infographic.
*   **Dynamic Visuals with HTML/CSS**: Generates a completely custom HTML and CSS structure for each presentation, ensuring a unique, responsive, 16:9 mobile-first design.
*   **Smart Image Integration**: Automatically fetches relevant high-quality background and content images using the Unsplash API to enhance visual appeal.
*   **Live Interactive Viewer**: Previews the generated infographic seamlessly inside a high-performance in-app webview (`flutter_inappwebview`).
*   **Live Text Editing**: Users can tap and edit the generated text on the fly directly from the infographic viewer.
*   **PDF Export**: Converts the HTML output into a crisp PDF document with properly paginated sections.
*   **PPTX (PowerPoint) Export**: Intelligently captures screenshots of the 16:9 infographic sections and bundles them into a presentation-ready PDF/PPTX format.
*   **Secure API Handling**: Uses a custom `api_key_pool` package to securely fetch and manage API keys for Gemini AI and Unsplash.

## 🛠️ Tech Stack

*   **Framework**: Flutter 3.x / Dart
*   **State Management**: GetX (`get` package)
*   **AI Integration**: `google_generative_ai` (Gemini API)
*   **Backend & Config**: Firebase Core, Firebase Analytics, Firebase Remote Config
*   **Image Sourcing**: Unsplash API (`http` package)
*   **Web Rendering**: `flutter_inappwebview`
*   **Document Export**: `pdf`, `printing`, `screenshot`

## 📂 Project Structure

The project follows a modular Architecture based on the GetX pattern:

```text
lib/
├── app/
│   ├── data/
│   │   ├── config/          # Configurations (Unsplash, etc.)
│   │   ├── models/          # Data models (InfographicModel)
│   │   └── services/        # Core business logic
│   │       ├── gemini_service.dart     # Handles AI generation prompts and parsing
│   │       ├── pdf_service.dart        # HTML to PDF conversion logic
│   │       ├── pptx_service.dart       # Presentation slide generation
│   │       ├── unsplash_service.dart   # Fetches images dynamically
│   │       └── remote-config-service.dart # Firebase remote configs
│   ├── modules/
│   │   ├── home/            # Initial prompt input screen (Imagine X)
│   │   └── infographic_viewer/ # Webview screen for viewing/editing/exporting
│   ├── routes/              # App routing configuration
│   └── utils/               # App theme, strings, AI config constants
└── main.dart                # Application entry point and initializations
```

## ⚙️ How the AI Generation Works

1.  **User Input**: The user enters a topic (e.g., "5G Technology") on the Home Screen.
2.  **Prompt Engineering**: The `GeminiService` passes a highly detailed system instruction to the Gemini model. It strict enforcement to return **ONLY valid JSON** containing two keys: `html` (the content structure) and `css` (the styling).
3.  **Data Structuring**: The AI is instructed to generate 6-8 distinct sections (Executive Summary, Statistics, Charts, etc.) optimized for a 16:9 mobile-friendly aspect ratio. It uses CSS shapes, gradients, and FontAwesome icons instead of relying on external image links.
4.  **Image Augmentation**: The `UnsplashService` runs parallel searches based on the topic to fetch 2-3 strategic high-quality background images to inject into the timeline or header.
5.  **Rendering**: The combined HTML and CSS strings are passed to the `InfographicViewerView` and rendered offline safely inside a `flutter_inappwebview`.
6.  **Exporting**: 
    *   For **PDFs**, the DOM is parsed, and sections (`.section-16-9`) are translated into native PDF pages.
    *   For **Presentations**, the app takes high-quality screenshots of the rendered webview sections and stitches them into landscape slides.

## 🚀 Setup & Installation

### Prerequisites
*   Flutter SDK (^3.8.1)
*   Android Studio / Xcode
*   A Firebase Project with Analytics and Remote Config enabled.
*   An Unsplash Developer Account (for API Access).

### Step-by-Step Guide

1.  **Clone the repository**
    ```bash
    git clone https://github.com/YourUsername/ai-presentation-doc.git
    cd ai-presentation-doc
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Configure API Keys**
    *   The project uses `api_key_pool` for the Gemini API key. Ensure the config package is properly linked.
    *   Configure your Firebase `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).
    *   Update your Unsplash API Key in `lib/app/data/config/unsplash_config.dart`.

4.  **Run the App**
    ```bash
    flutter run
    ```
    *Note: The project is strictly configured to use a Java 17/21 runtime for Android Gradle builds (Java 25 is currently incompatible).*

## 📱 Screenshots & UI

*(Add screenshots of the Home Screen and the Infographic Viewer here)*

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
