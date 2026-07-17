# 🎨 Amazing Colors 

[![style: solid](https://img.shields.io/badge/style-solid-orange)](https://pub.dev/packages/solid_lints)

A beautiful, interactive, and cleanly architected Flutter application that generates random background colors with a single tap. 

Beyond just changing colors, the app intelligently calculates the luminance of the generated background to automatically adjust the text and system UI colors (light or dark), ensuring perfect contrast and readability at all times.

## ✨ Features

* **Tap to Change:** Tap anywhere on the screen to generate a random background color.
* **Smart Contrast:** Automatically calculates background luminance to switch text and icon colors between black and white for maximum accessibility.
* **Hex Code Display:** Shows the exact Hexadecimal string (e.g., `#4CAF50`) of the current color.
* **Copy to Clipboard:** Easily copy the generated hex code with a dedicated button.
* **Smooth Animations:** Seamless transition between colors using `AnimatedContainer`.
* **Dynamic Status Bar:** Updates the device's status bar brightness to match the background.

## 📸 Screenshots

| Light Background Example | Dark Background Example |
| :---: | :---: 
| <img width="250" height="520" alt="Screenshot_20260716_220847" src="https://github.com/user-attachments/assets/3316c39f-07ae-40f7-8e5f-9812bfb4b226" /> | <img width="250" height="520" alt="Screenshot_20260716_220808" src="https://github.com/user-attachments/assets/83cd5412-30d6-4ada-9368-2faafa0e1eb3" /> | 




https://github.com/user-attachments/assets/03f9670a-d4d9-49c1-b7ab-f9da0bc987ec 



## 🛠️ Tech Stack & Architecture

This project follows clean code principles and separates business logic from the UI using the **BLoC/Cubit** pattern.

* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
* **Value Equality:** [equatable](https://pub.dev/packages/equatable)
* **Testing:** 
  * [bloc_test](https://pub.dev/packages/bloc_test) (Unit testing the Cubit state emissions)
  * `flutter_test` (Widget and integration testing)

## 📂 Project Structure

```text
amazing-colors/
├── integration_test/
│   └── app_test.dart                         # End-to-end integration tests
├── lib/
│   ├── app/
│   │   ├── core/
│   │   │   ├── extensions/
│   │   │   │   └── color_converter_extension.dart # Color utility extensions
│   │   │   └── styles/
│   │   │       ├── app_colors.dart           # Theme color definitions
│   │   │       └── app_text_style.dart       # Typography definitions
│   │   └── modules/
│   │       └── home/
│   │           └── presentation/
│   │               ├── bloc/
│   │               │   ├── color_cubit.dart      # Business logic for color generation
│   │               │   └── color_state.dart      # State representation
│   │               └── view/
│   │                   └── home_page.dart        # Main UI screen
│   └── main.dart                             # Application entry point
└── test/
    └── cubit/
        └── color_cubit_test.dart             # Unit tests for ColorCubit
