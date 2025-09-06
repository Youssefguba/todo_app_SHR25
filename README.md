# Todo App

This is a simple To-Do List application built with Flutter. It demonstrates core concepts such as state management using the BLoC pattern (specifically with Cubit), local data persistence, and building a reactive UI.

## Features

-   **User Authentication:** A basic login screen with email validation.
-   **CRUD Operations:** Create, read, and delete todo items.
-   **State Management:** Utilizes `flutter_bloc` for predictable and scalable state management.
-   **Local Persistence:** Saves todos on the device using `shared_preferences`, so your list is preserved between sessions.

## Architecture Overview

-   **State Management:** The app's state is managed by `TodoCubit`, which handles the business logic for adding, deleting, and loading todos. A `BlocObserver` is implemented in `lib/blocs/bloc_observer.dart` to log all state changes for easier debugging.

-   **Data Persistence:** Todo items are stored locally using the `shared_preferences` package. The `TodoModel` is serialized to a JSON string before being saved and deserialized when loaded, allowing complex data structures to be stored efficiently.

-   **UI:** The application consists of two main screens: `LoginScreen` and `TodoScreen`. The UI is built to be reactive, automatically updating when the state changes, thanks to the `BlocBuilder` widget.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   An installed version of the [Flutter SDK](https://flutter.dev/docs/get-started/install).

### Installation & Running

1.  Clone the repository:
    ```sh
    git clone https://github.com/youssefguba/todo_app_shr25.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd todo_app_shr25
    ```
3.  Install the dependencies:
    ```sh
    flutter pub get
    ```
4.  Connect a device or start an emulator.
5.  Run the application:
    ```sh
    flutter run
