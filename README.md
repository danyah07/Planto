# Planto - Plant Care Reminder Application

An iOS application built with SwiftUI that helps users manage plant care schedules through timely notifications.


## Features

- Plant management (add, edit, delete)
- Watering reminders with local notifications
- Progress tracking
- Data persistence using UserDefaults

## Architecture

The application follows the MVVM (Model-View-ViewModel) pattern:
```
Models/
  └── PlantReminderModel.swift
ViewModels/
  ├── PlantReminderViewModel.swift
  └── FirstViewModel.swift
Views/
  ├── FirstView.swift
  ├── MainView.swift
  └── PlantReminderSheet.swift
Managers/
  └── NotificationManager.swift
```

## Installation

1. Clone the repository
2. Open `Planto.xcodeproj` in Xcode
3. Add required images (`plant1`, `plant2`) to Assets
4. Build and run on device or simulator



## Notifications

The app requests notification permissions on first launch. Users can modify permissions in iOS Settings.


## Author

[Daniyah ALbarqawi]
