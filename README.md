📘 ClassMate – Student Management App

A Flutter + Firebase based student management system with clean UI, cloud storage, authentication, and full CRUD functionality.

This app allows an admin to securely log in and manage student records with ease — including adding, viewing, updating, and deleting records.
A screen recording demo has been included for easy evaluation.


🚀 Features
🔐 Authentication

Admin signup & login using Firebase Authentication

Email + Password secure login

Local session persistence using Hive (admin stays logged in even after closing the app)

🧑‍🎓 Student Management

Add Student

View Student List

Edit Student Details 

Delete Student

Prevents duplicate roll numbers

Fully validated form fields

🔍 Validation

All fields required

Email format validation

Year allowed only between 1–5

Roll Number uniqueness enforced via Firestore query

📡 Backend Integration

Firestore used for:

Student data storage

Real-time listing with snapshots

Fast querying for roll number checks

🎬 UI/UX & Animations

Smooth animated splash screen

Welcome screen with fade-in animation

Clean Material UI layout

Modern card-style student list

🛠️ Tech Stack
🎨 Frontend

Flutter (Dart)

Material UI

Animations (Fade, Scale, PageRoute transitions)

☁️ Backend

Firebase Authentication

Firebase Cloud Firestore

Firebase Core

💾 Local Storage

Hive

Stores login session: isLoggedIn, email

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
Method 1: Using the App

Login as Admin

Go to Add Student

Enter sample data such as:

First Name: John
Last Name: Doe
Email: john@example.com
Roll Number: 101
Year: 3


Tap Save Student

Method 2: Using Firebase Console

Open Firebase → Firestore Database

Select students collection

Add a new document with the same fields

🔧 Hive Local Persistence

Stored values:

authBox.put("isLoggedIn", true);
authBox.put("email", adminEmail);


On app launch:

If isLoggedIn == true → Skip login → Go directly to HomeScreen

Else → Show Welcome/Login

📦 Validations Implemented

✔ All fields required
✔ Proper email format
✔ Year must be between 1–5
✔ Roll number uniqueness check via Firestore
✔ Error messages shown using SnackBars
✔ All CRUD operations fully functional

🎞️ App Demo Recording

A full screen recording of the working app is included:

📂 app-screen recording/clasmate-screen record.mp4
(Video captured directly from device for evaluation)

🧭 Assumptions

Only one role exists → Admin

Students are records, not app users

Admin details are minimal (email only)

Search, filters, pagination not added due to time constraints

🚀 If More Time Was Available
✨ UI/UX Enhancements

Custom fonts

Micro animations

Better list UI (avatars, grouping, sorting)

📚 Feature Improvements

Advanced search & filters

Student profile view page

Export to PDF/Excel

Bulk import via CSV

Attendance/Marks modules

🔐 Security Enhancements

Firestore rules hardening

Admin role separation

Logging & audit trails

📦 Offline Support

Full offline CRUD using Hive + sync

Background sync when online

🎯 Conclusion

ClassMate demonstrates a clean, scalable structure with proper authentication, cloud database integration, and a simple student management workflow.
The architecture is modular, feature-based, and ready for future enhancements.
