
# Fetch HTTP Data

## User Directory App
A Flutter application that fetches and displays user information from the JSONPlaceholder API.

## Features
- Fetch user data from the JSONPlaceholder API.
- Display user information in an expandable card format.
- Show detailed user information including:
  - Name and username
  - Email address
  - Phone number
  - Website
  - Complete address with geo-location
  - Company details
- Error handling with a retry mechanism.
- Loading state management.
- Clean and responsive UI.

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Dart SDK (latest version)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   ```

2. Navigate to the project directory:
   ```bash
   cd user_directory
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure
```
lib/
├── main.dart
├── models/
│   ├── user.dart
│   ├── address.dart
│   ├── company.dart
│   └── geo.dart
├── services/
│   └── user_service.dart
└── screens/
    └── user_screen.dart
```

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5
  flutter_screenutil: ^5.9.3
```

## API Reference
The app uses the JSONPlaceholder API:

- **Endpoint:** https://jsonplaceholder.typicode.com/users
- **Method:** GET
- **Response:** List of user objects

### Example User Object:
```json
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
}
```
