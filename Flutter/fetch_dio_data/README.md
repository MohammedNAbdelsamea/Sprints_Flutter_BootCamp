
# Fetch Dio Data - User Directory App

A Flutter application that fetches and displays user information from the JSONPlaceholder API using Dio for network requests and SharedPreferences for caching.

## 📋 Features
- Fetch user data from the JSONPlaceholder API.
- Display user information in an expandable card format.
- Show detailed user information including:
    - Name and username
    - Email address
    - Phone number
    - Website
    - Complete address with geo-location
    - Company details
- Error handling with retry mechanism.
- Caching user data using SharedPreferences.
- Clean and responsive UI.

## 📂 Project Structure
```
lib/
├── main.dart
├── models/
│   ├── address.dart
│   ├── company.dart
    ├── geo.dart
│   └── user.dart
├── service/
│   └── user_service.dart
├── views/
│   └── user_details.dart
    └──user_list_screen.dart 
└── widgets/
    ├── cache_info_banner.dart
    ├── detail_row.dart
    └── info_card.dart
    └── user_card.dart
    └── user_list_body.dart
```

## 🛠 Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.7.0
  flutter_screenutil: ^5.9.3
  shared_preferences: ^2.3.3
```

## 🚀 Getting Started



### Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   ```

2. Navigate to the project directory:
   ```bash
   cd fetch_dio_data
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 🌐 API Reference
The app uses the JSONPlaceholder API to fetch user data.

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

