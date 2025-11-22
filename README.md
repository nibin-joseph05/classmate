📘 ClassMate – Student Management App (Flutter + Firebase)

ClassMate is a simple and clean Student Management App built using Flutter, with Firebase Authentication for admin login and Cloud Firestore for student data storage.
The app allows an admin to:

Log in / Sign up using email & password

Add new student records

View student list

Ensure roll number uniqueness

Validate required fields

Store student information properly

Stay logged in using local Hive persistence

🔧 Tech Stack & Storage Used
Frontend

Flutter (UI + Navigation)

Material 3 Theme

Backend / Services

Firebase Authentication
→ Used for admin login/signup only

Cloud Firestore
→ Used to store student records

Hive Local Storage
→ Stores admin login state (isLoggedIn)

☁️ Why Firestore Was Used

Firestore was chosen because:

It supports structured documents

Built-in query support (used for roll number uniqueness)

Real-time updates

Free tier is sufficient for this test

Easy integration with Flutter

Firestore structure used:

students
└── <auto_id>
firstName: string
lastName: string
email: string
rollNumber: number
year: number (1–5)

🧪 How to Create Sample Test Data
Method 1: Through the App

Log in as Admin

Go to “Add Student”

Enter sample values like:

First Name: John
Last Name: Doe
Email: john.doe@example.com
Roll Number: 101
Year: 3


Press “Save Student”

Method 2: Using Firebase Console

Go to Firebase → Firestore Database

Click students → Add Document

Add fields manually:

firstName: "John"
lastName: "Doe"
email: "john@example.com"
rollNumber: 101
year: 3

📝 Validations Implemented

All fields required

Email format validated

Year restricted to values 1–5

Roll number uniqueness enforced using:

where('rollNumber', isEqualTo: enteredRollNumber)


Errors shown using SnackBars

Smooth navigation and success feedback

💾 Local Persistence (Hive)

Hive is used to store only admin session data:

authBox.put("isLoggedIn", true);
authBox.put("email", "admin@example.com");


On app launch, Splash Screen checks:

If isLoggedIn == true → Go directly to Home

Else → Go to Welcome/Login

🧭 Assumptions Made

Only one type of user exists: Admin
(Students are not users; they are just records.)

Admin does not need a detailed profile — only email/password stored by Firebase Auth.

Additional features like sorting, search, filters, or pagination were considered out of scope due to time constraints but can be added easily.

🚀 If More Time Was Given, I Would Improve:
✨ UI Enhancements

Better theming with custom fonts

Animated transitions

Modern cards for student lists

📚 Features

Student editing

Student search + filters

Admin dashboard with statistics

Export records as PDF/Excel

🔐 Security

Firestore rules to restrict write access only when logged in

Proper role-based access control

📦 Offline Support

Sync with local database (Hive / SQLite)

Full offline CRUD with queued updates