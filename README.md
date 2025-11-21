**📱 Mini Lead Management App – Flutter Internship Assignment**

A simple CRM-style Lead Management application built using Flutter, Provider, and SQLite.
This project was created as part of the Flutter Internship Assignment.

**🚀 Features**
✅ Core Features
Add new leads
View all leads
Update lead status
    New
    Contacted
    Converted
    Lost
Edit and delete leads
Status filter (All/New/Contacted/Converted/Lost)
Local storage using SQLite
State management using Provider

🏗️ Project Architecture
lib/
│
├── models/
│   └── lead.dart
│
├── db/
│   └── db_helper.dart
│
├── providers/
│   └── lead_provider.dart
│
├── screens/
│   ├── home_page.dart
│   ├── add_lead.dart
│   ├── edit_lead.dart
│   ├── lead_details.dart
│
└── widgets/
    └── lead_tile.dart

📦 Packages Used
**Package     	 Purpose**
provider	     State management
sqflite	       Local database
path	         Database path
google_fonts	 Modern UI fonts
