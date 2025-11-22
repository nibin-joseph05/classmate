📘 ClassMate – Student Management App

A Flutter + Firebase based student record management system

ClassMate is a clean and efficient Student Management Application designed using Flutter, with Firebase Authentication for secure admin login and Cloud Firestore for real-time student data storage.

The app is built to help admins easily manage student records with features such as adding, viewing, and validating entries, along with local login persistence using Hive.

🚀 Features
🔐 Authentication

Admin login & signup using Firebase Authentication

Email + Password based secure access

Local session persistence using Hive
→ User stays logged-in even after restarting the app

🧑‍🎓 Student Management

Add new student records

View complete student list

Prevent duplicate roll numbers
→ Checked using Firestore query

🔍 Validation

All fields required

Email format validation

Year allowed only between 1–5

📡 Backend Integration

Cloud Firestore used for:

Student data storage

Real-time listing

Querying roll numbers

🛠️ Tech Stack
🎨 Frontend

Flutter (Dart)

Material Design UI

Smooth navigation & animations

☁️ Backend

Firebase Authentication

Cloud Firestore

Firebase Core

💾 Local Storage

Hive
→ Stores user session (isLoggedIn, email)

📂 Firestore Structure
students
│
└── <auto_id>
├── firstName: string
├── lastName: string
├── email: string
├── rollNumber: number
└── year: number (1–5)

🧪 How to Add Test Data
Method 1: Through the App

Log in as admin

Open Add Student

Enter sample data:

First Name: John
Last Name: Doe
Email: john@example.com
Roll Number: 101
Year: 3


Tap Save Student

Method 2: Firebase Console

Go to Firebase → Firestore Database

Open students collection

Add a new document with fields listed above

🔧 Hive Local Persistence

Hive stores admin session locally:

authBox.put("isLoggedIn", true);
authBox.put("email", userEmail);


On app startup:

If isLoggedIn == true → Navigate to HomeScreen

Else → Show WelcomeScreen / LoginScreen

📦 Validations Implemented

✔ All fields required
✔ Email format validated
✔ Year must be between 1–5
✔ Roll number uniqueness validated via:

.where('rollNumber', isEqualTo: roll)


✔ Errors shown using SnackBars
✔ Safe navigation with error handling

🧭 Assumptions

Only one user role exists → Admin

Students are records, not app users

Admin profile minimal (email only)

Sorting, search, and analytics left out due to time limits

🚀 If More Time Was Available
✨ UI/UX Upgrades

Custom fonts

Animated transitions

Better student list cards

📚 More Features

Edit student details

Search and filter students

Dashboard with analytics

Export student list (PDF/Excel)

Bulk data import

🔐 Security Enhancements

Restrictive Firestore Rules

Role-based access control

Logging & audit trails

📦 Offline Support

Local SQLite/Hive sync

Offline-first CRUD

Auto-sync when online

🎯 Conclusion

ClassMate demonstrates a clean, scalable structure with proper authentication, cloud database integration, and a simple student management workflow.
The architecture is modular, feature-based, and ready for future enhancements.