# Asesmen PAUD Ainun Habibie - Front End Application

This repository contains the front-end source code for the APAH (Asesmen PAUD Ainun Habibie) mobile application. Built with Flutter, this application provides a user-friendly interface for teachers to manage student assessments digitally on the Android platform.

## About The Project
This application was developed as a final year thesis project to solve the challenges of manual, paper-based student assessments at PAUD Ainun Habibie in Semarang. It empowers teachers by replacing an inefficient workflow with a real-time, structured, and easy-to-use mobile tool, allowing them to focus more on student development rather than administrative tasks.

## Key Features
- Secure Authentication: A dedicated login screen for teachers.
- Dashboard: A central hub for quick access to all primary modules.
- Student Management: Full CRUD (Create, Read, Update, Delete) functionality for managing student profiles.
- Dynamic Assessments: Support for creating and managing four different assessment types:
  - Anecdotal Records
  - Artwork Analysis
  - Checklists
  - Photo Series
- Automated Reporting: Generate and manage monthly assessment reports for each student.

# Getting Started
To get a local copy up and running, follow these steps.

## Prerequisites
- Flutter SDK (Version 3.29.3 or compatible)
- Dart SDK (Version 3.7.2 or compatible)
- A code editor like VS Code or Android Studio
- An Android emulator or a physical device

## Installation
1. Clone the repository
   ```bash
   git clone https://github.com/PinKevin/APAH-FE.git
   cd APAH-FE
   ```
2. Install dependencies
   ```bash
   flutter pub get
   ```
3. Connect to the Back-End API
   - Make sure the [APAH-BE (API Server)](https://github.com/PinKevin/APAH-API) is running.
   - Update the API base URL in the Flutter project's configuration file to point to your local or deployed back-end server.
4. Run the application
    ```bash
   flutter run
   ```

# Copyright and License
© 2025 Drs. Eko Adi Sarwoko, M.Kom.; Emerio Kevin Aryaputra; Dr. Aris Puji Widodo, S.Si., M.T. All Rights Reserved.

The source code for this project is currently in the process of official copyright registration with the Directorate General of Intellectual Property, Ministry of Law and Human Rights of the Republic of Indonesia via Universitas Diponegoro Directorate of Innovation, Downstreaming, and Cooperation. Unauthorized use, reproduction, or distribution of this software is strictly prohibited.

This project is licensed under the MIT License - see the LICENSE file for details.
