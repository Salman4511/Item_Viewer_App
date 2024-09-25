# Item Viewer App

A Flutter application that displays a list of items fetched from a public API. Users can view details of each item by tapping on it. The app includes features like pull-to-refresh, search functionality, light/dark mode toggle, and error handling.

> **Note:** The thumbnail and image URL are static in this app since the public API used does not provide them. Dummy data is used for the images.

## Features

## Features

- **Home Screen**: Displays a list of items with a thumbnail, title, and description. Includes a search bar to filter items by title.
- **Detail Screen**: Shows full details of the selected item, including a larger image, title, and description.
- **State Management**: Uses the `Provider` package to manage app state and handle API calls.
- **Pull-to-Refresh**: Allows users to refresh the item list by pulling down on the screen.
- **Search Feature**: Users can filter the items by typing keywords into the search bar.
- **Error Handling**: Displays appropriate messages for loading errors and empty states.
- **Theme Support**: Toggle between light and dark mode.

## Screenshots

| Home Screen (Light) | Home Screen (Dark) | Detail Screen (Light)| Detail Screen (Dark)|
| --- | --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/a4f3a235-fcbe-4a2e-86c6-fda1cda540fc" width="300"/> | <img src="https://github.com/user-attachments/assets/602c03bf-2dfa-4035-90ec-2b82af3eb065" width="300"/> | <img src="https://github.com/user-attachments/assets/7e3599bb-afa3-430b-9a3b-d88707946204" width="300"/> |  <img src="https://github.com/user-attachments/assets/9b558ee4-a86b-4dc2-a44e-4f9c728c42ba" width="300"/>

## Technologies Used

- **Flutter**: Dart framework for building cross-platform apps.
- **Provider**: State management solution.
- **HTTP**: To fetch data from the public API.
- **JSONPlaceholder API**: Mock API used for fetching item data.

## Setup and Installation

Follow these instructions to get the project up and running on your local machine.

### Steps

1. **Clone the repository:**

   ```
   https://github.com/Salman4511/Item_Viewer_App.git
   cd item_viewer_app
   ```
2. **Install dependencies:**
   
   ```
   flutter pub get
   ```
4. **Run the app:**
   
   ```
   flutter run
   You can also run the app on an emulator or a physical device by selecting a device in Visual Studio Code or Android Studio and running:
   ```

## Folder Structure
```
lib/
├── main.dart                # Entry point of the app
├── models/
│   └── item.dart            # Model class for items
├── controllers/
│   └── item_provider.dart   # State management logic for items
├── services/
│   └── api_service.dart     # service file for fetching data from API
├── views/
│   ├── home_screen.dart     # Home screen with item list
│   └── detail_screen.dart   # Detail screen for viewing item details
├── widgets/
│   └── item_tile.dart       # Custom widget for displaying individual items in the list
└── utils/
    └── theme.dart           # Theme configuration (light/dark)
```

### Code Architecture

The app follows a clean code architecture that separates the business logic from the UI. This makes the app modular, scalable, and easy to maintain.

- Models: Contains the data models (e.g., Item).
- Controllers: Manages the state of the app using Provider (ItemProvider).
- Views: UI screens (HomeScreen and DetailScreen).
- Widgets: Custom reusable UI components (e.g., ItemTile).
- Utils: Utilities such as theming for light and dark modes.

### API Integration
The app fetches item data from the JSONPlaceholder API. You can view the data at:
  ```
  https://jsonplaceholder.typicode.com/posts
  ```

### Error Handling

- Displays a loading indicator while fetching data.
- Shows an error message if there is an issue fetching data.
- Handles empty states by displaying a "No items found" message.

### Contact
If you have any questions, feel free to reach out:

SalmanulFaris k: salmanulfaris4511@gmail.com  
GitHub: https://github.com/Salman4511
