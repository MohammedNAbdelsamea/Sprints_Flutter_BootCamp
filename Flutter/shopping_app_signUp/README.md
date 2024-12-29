# Shopping App

A responsive Flutter shopping application featuring secure user authentication, product displays, hot offers, and a clean user interface.

## Features

### Authentication
- **Sign Up System**
  - Secure user registration form
  - Real-time input validation:
    - Capitalized first letter validation for full name
    - Email format validation (@)
    - Password strength validation (minimum 6 characters)
    - Password confirmation matching
  - Success dialog with navigation flow
  - Responsive form layout adapting to different screen sizes

### Shopping Interface
- **Product Showcase**
  - Dynamic product grid display
  - Horizontal page view for featured products
  - Add to cart functionality with visual feedback

- **Hot Offers Section**
  - Horizontal scrollable offers list
  - Percentage-based discounts
  - Circular product images with custom styling

### Design & User Experience
- **Responsive Design**
  - Adapts to different screen sizes
  - Consistent layout across devices
  - Optimized for both portrait and landscape modes

- **Custom Components**
  - Reusable text form fields with validation
  - Custom styled buttons
  - Success dialogs with animations
  - Responsive app bar with contextual navigation

### Form Validation Rules
- Full Name: Must start with a capital letter
- Email: Must contain '@' symbol
- Password: Minimum 6 characters required
- Confirm Password: Must match the entered password

### Navigation Flow
1. Sign Up Page
2. Success Dialog
3. Shopping Home Page

## Technical Details
- Built with Flutter
- Implements MediaQuery for responsive layouts
- Custom widgets for reusability
- Form validation using GlobalKey<FormState>
- Stateful widget management