# Grocery Dashboard Flutter

A **responsive admin dashboard** built with Flutter for managing the Grocery e-commerce platform.  
It provides administrators with tools to manage products, users, and orders, with a clean architecture and API integration.  

---

## 🚀 Problem Solved
While the **Grocery Flutter App** handles the **customer experience**, administrators also need a secure and efficient interface to manage the platform.  
This dashboard solves that by offering a **cross-platform, responsive** admin panel built in Flutter — removing the need for a web-only solution.  

---

## ✨ Features
- 📊 **Responsive Design**
  - Works on desktop, tablet, and mobile
- 🔐 **Admin Management**
  - Secure login (via backend API)
  - Role-based access (admins, staff)
- 🛒 **E-Commerce Management**
  - Create, update, delete products
  - Manage orders and track status
  - Manage users/customers
- 🌐 **API Integration**
  - Connects with the [Grocery Node.js API](https://github.com/Schandroid243/Grocery_NodeJs_Api)
- 🧩 **Clean Architecture**
  - `controller/` → Business logic
  - `api/` → REST API calls
  - `models/` → Data models
  - `screens/` → Dashboard pages
  - `responsive/` → Adaptive layout
  - `helper/` → Utilities & helpers
  - `config/` → App configuration
  - `utils/` → Shared utilities
  - `main.dart` → Entry point
- 🎨 **Custom UI**
  - Dashboard widgets
  - Stats panels
  - Reusable components

---

## 🛠 Tech Stack
- **Flutter** (Dart)
- **Provider / State Management**
- **Dio / http** for API calls
- **Responsive Layout Utilities**
- **Material Design** UI

---

## 🏃 How to Run Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/Schandroid243/Grocery_Dashboard_Flutter.git
   cd Grocery_Dashboard_Flutter
   git checkout dev
2. **Install dependencies**
   ```bash
   flutter pub get
3. **Configure API**
   - Open lib/config/config.dart
   - Set your backend API base URL (from Grocery_NodeJs_Api): const String apiBaseUrl = "http://localhost:3000/api";
4. **Run the app**
   ```bash
   flutter run -d chrome   # For web dashboard
   flutter run             # For mobile/desktop

## 🔮 Future Improvements
- Data visualization with charts
- Export reports (CSV, PDF)
- Push notifications for order updates
- Multi-language support
