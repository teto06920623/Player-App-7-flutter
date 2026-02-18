# 🎧 Islamic Audio Player App

A serene and feature-rich **Islamic Audio Player** built with **Flutter**. This application provides a seamless experience for listening to Quran recitations, Nasheeds, and Islamic lectures with a beautiful, user-friendly interface.

## 📸 Screenshots

<div align="center">
  <table style="border: none; border-collapse: collapse;">
    <tr>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/e3a181f1-c6ae-4772-95b0-b596c7b0fbc6" width="250" alt="Splash Screen" />
        <br /><sub><strong>App Launch & Splash</strong></sub>
      </td>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/80a077d6-960c-4da2-93fe-29910170d109" width="250" alt="Library Dashboard" />
        <br /><sub><strong>Library Dashboard</strong></sub>
      </td>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/8915d6bb-6330-41f9-a4ec-25565543ce29" width="250" alt="Ramadan Collection" />
        <br /><sub><strong>Ramadan Collection</strong></sub>
      </td>
    </tr>
    <tr>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/4a689197-b7cc-474d-875a-dd64a65e2691" width="250" alt="Reflective Playlist" />
        <br /><sub><strong>Reflective (Hazin) Playlist</strong></sub>
      </td>
      <td align="center" style="border: none;">
        <img src="https://github.com/user-attachments/assets/569daf5d-2d64-4be8-b576-2b2f3d135898" width="250" alt="Educational Podcasts" />
        <br /><sub><strong>Islamic Podcasts & Lectures</strong></sub>
      </td>
      <td style="border: none;"></td>
    </tr>
  </table>
</div>

## ✨ Features

- **Categorized Library:** Easy navigation between Ramadan Anashid, Emotional Tracks, and Podcasts.
- **Audio Playback Control:** Play, pause, resume, and seek functionality for audio tracks.
- **Beautiful UI:**
  - Dark theme with Islamic aesthetic design.
  - Custom category cards with dedicated artwork.
- **Responsive Layout:** Adapts perfectly to different screen sizes.
- **Local Asset Handling:** Optimized for playing high-quality local audio files.

## 🛠️ Tech Stack & Dependencies

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **State Management:** `setState` (MVC Pattern).
- **Core Widgets:** `ListView`, `Slider`, `InkWell`, `Container`.

## 📂 Project Structure

```text
lib/
├── models/
│   └── model.dart           # Audio Data Model
├── screens/
│   ├── splash_screan.dart   # App Intro
│   ├── lists_screen.dart    # Main Library Dashboard
│   ├── playerscreen.dart    # Player UI Logic
│   └── playlistscreen.dart  # Specific Category Views
└── main.dart                # Application Entry Point
