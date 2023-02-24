# ZAPTOS
ZAPTOS is a shoe marketplace app that allows users to browse and purchase shoes from popular brands such as Adidas, Nike, and Puma. The app also includes a payment system powered by Stripe for secure transactions.

## Technologies

- Swift
- SwiftUI
- Combine
- Firebase Authentication
- Firebase Firestore
- Heroku

## Features

- Authentication system powered by Firebase Auth
- Shoe data retrieved from a RESTful API hosted on Heroku
- Payment system powered by Stripe
- SwiftUI for the user interface
- Combine for reactive programming
- MVVM architecture for code organization and maintainability

## Architecture
ZAPTOS uses the MVVM (Model-View-ViewModel) architecture pattern for code organization and maintainability. This pattern separates the user interface (View) from the data and business logic (ViewModel), resulting in a cleaner and more maintainable codebase.

The `AppViewModel` handles the app's authentication and user-related logic. It uses Firebase Auth to manage user authentication and includes methods for signing up, logging in, and logging out. It also uses Combine to publish changes to the app's state.

The `PaymentViewModel` retrieves the payment link from the app's backend server and publishes changes to the app's state using Combine. It uses `URLSession.DataTaskPublisher` to make network requests to the server and handles errors with `replaceError`.

The `ShoeViewModelCombine` retrieves shoe data from the app's backend server and publishes changes to the app's state using Combine. It uses `URLSession.DataTaskPublisher` to make network requests to the server and handles errors with `replaceError`.
