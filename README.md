# Imagine X - Infographic Generator

A powerful Flutter application that instantly transforms ideas and text prompts into beautiful, professional, and mobile-friendly infographics using **Groq AI (Llama 3.3 70B)**. The generated presentations can be directly exported to PDF or PPTX formats.

## 🌟 Features

*   **Next-Gen AI Generation**: Leverages the high-performance **Llama 3.3 70B** model via **Groq API** for intelligent, data-rich infographic structuring.
*   **High Data Density**: Specifically engineered to produce 10+ sections with 20+ unique statistics and data points per infographic.
*   **Dynamic Visuals with HTML/CSS**: Generates custom HTML5 and CSS3 structures ensuring a responsive, glassmorphic, mobile-first design.
*   **Theme & Layout Sync**: Automatically adapts the generated design to the user's selected color theme and layout template.
*   **Live Interactive Viewer**: Previews the generated infographic seamlessly inside a high-performance in-app webview (`flutter_inappwebview`).
*   **Live Text Editing**: Users can tap and edit the generated text on the fly directly from the infographic viewer.
*   **Smart Iconography**: Integrated with Font Awesome 6 for context-aware, topic-relevant icons in every section.
*   **Multi-API Key Rotation**: Robust error handling that automatically rotates through multiple Groq API keys to bypass rate limits (413/429).
*   **Secure Secret Management**: Uses a git-ignored configuration system to keep sensitive API keys safe while maintaining local development functionality.

## 🛠️ Tech Stack

*   **Framework**: Flutter 3.x / Dart
*   **State Management**: GetX (`get` package)
*   **AI Integration**: **Groq API** (Llama 3.3 70B - Versatile)
*   **Backend & Config**: Firebase Core, Firebase Analytics, Firebase Remote Config
*   **Web Rendering**: `flutter_inappwebview` (Offstage rendering for high SEO performance)
*   **Styling**: HTML5, CSS3 (Gradients, Flexbox, Glassmorphism)
*   **Document Export**: `pdf`, `printing`, `screenshot`

## 📂 Project Structure

The project follows a modular Architecture based on the GetX pattern:

```text
lib/
├── app/
│   ├── data/
│   │   ├── models/          # Data models (InfographicModel, TemplateModel)
│   │   ├── templates/       # Professional PPT layout and theme definitions
│   │   └── services/        # Core business logic
│   │       ├── gemini_service.dart     # Handles Groq/AI generation logic
│   │       ├── pdf_service.dart        # HTML to PDF conversion
│   │       └── remote-config-service.dart # Firebase remote configs
│   ├── modules/
│   │   ├── home/            # Imagine X input screen with theme/layout selection
│   │   └── infographic_viewer/ # Interactive rendering and export screen
│   ├── routes/              # App routing
│   └── utils/               # Secure Keys, Global Themes, and Constants
└── main.dart                # Application entry point
```

## ⚙️ How the AI Generation Works

1.  **User Configuration**: The user enters a topic and selects a design theme (e.g., Oceanic, Sunset) and a layout template.
2.  **Directive Prompting**: The `GeminiService` (now using Groq) constructs a forceful, compressed prompt including the selected theme's hex codes and layout styles.
3.  **Model Selection**: The app utilizes the **Llama 3.3 70B** model, which offers superior reasoning for complex JSON structures and rich content generation.
4.  **Parsing & Validation**: A robust regex-based parser extracts the JSON output. If the AI returns insufficient content (e.g., null HTML), the system detects it and retries or alerts the user.
5.  **Rendering**: The combined HTML and CSS are injected into a custom boilerplate that supports Google Fonts (Inter, Outfit, Poppins) and modern UI effects.
6.  **Secure Rotation**: If an API key hits a rate limit, the service immediately switches to the next available key in the `ApiKeys` pool to ensure zero downtime.

## 🚀 Setup & Installation

### Prerequisites
*   Flutter SDK (^3.8.1)
*   A Groq API Key ([Get one here](https://console.groq.com/))
*   A Firebase Project with Remote Config enabled.

### Step-by-Step Guide

1.  **Clone the repository**
    ```bash
    git clone https://github.com/IzzaTech-Hub/ai-presentation-doc.git
    cd ai-presentation-doc
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Configure API Keys (CRITICAL)**
    *   Create a new file at `lib/app/utils/api_keys.dart`.
    *   This file is already in `.gitignore` to prevent secret leaks.
    *   Add your Groq keys:
    ```dart
    class ApiKeys {
      static const List<String> groqKeys = [
        'YOUR_GROQ_API_KEY_1',
        'YOUR_GROQ_API_KEY_2',
      ];
    }
    ```

4.  **Firebase Setup**
    *   Add your `google-services.json` (Android) to `android/app/`.

5.  **Run the App**
    ```bash
    flutter run
    ```

## 📱 Screenshots & UI

*(Add screenshots demonstrating the new data-rich sections and glassmorphic UI)*

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
