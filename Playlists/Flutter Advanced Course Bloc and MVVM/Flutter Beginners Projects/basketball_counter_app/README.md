# Basketball Counter App with BLoC ()

## Overview

Welcome to the Basketball Counter App, a practical demonstration to understand BLoC, Cubit, and related concepts in Flutter. This app serves as an educational tool to grasp the fundamental principles of state management in Flutter applications.

## Concepts Covered

- **Cubit:** Learn about Cubit, a lightweight and reactive state management solution.
- **BlocProvider:** Understand how to use BlocProvider to provide the Basketball Cubit globally in your app.
- **BlocBuilder:** Explore the usage of BlocBuilder to efficiently rebuild UI components based on state changes.
- **BlocConsumer:** Learn how to use BlocConsumer to separate the UI components for rendering and handling state changes.

## App Functionality

The Basketball Counter App allows users to keep track of scores for two basketball teams. It demonstrates the use of BLoC concepts such as Cubit, states, BlocProvider, BlocBuilder, and BlocConsumer to manage the state of the scores efficiently.

## How to Use the App

1. Clone the repository: `git clone https://github.com/5alafawyyy/Dart-Language-Flutter-Framework/tree/main/Playlists/Flutter%20Advanced%20Course%20Bloc%20and%20MVVM/Flutter%20Beginners%20Projects/basketball_counter_app`
2. Navigate to the project directory: `cd Playlists/Flutter Advanced Course Bloc and MVVM/Flutter Beginners Projects/basketball_counter_app`
3. Run the app on an emulator or physical device using `flutter run`.

## App Structure

The app is structured as follows:

- `/lib`: Contains the main Dart code.
  - `/app`: Entry point for the Applicaion.
  - `/cubit`: Houses the Basketball Cubit to manage the state.
  - `/views`: Includes the main screen for score display and user interaction.

## Key Files

- `/lib/cubit/basketball_cubit.dart`: Implementation of the Basketball Cubit.
- `/lib/screens/main_screen.dart`: Main screen displaying team scores and buttons for score updates.

## Summary

### Cubit

Cubit is a lightweight and reactive state management solution. It helps in managing the state of an application in a clean and predictable way.

### BlocProvider

BlocProvider is used to provide the Basketball Cubit globally within the app. It ensures that all parts of the app have access to the same instance of the Cubit.

### BlocBuilder

BlocBuilder efficiently rebuilds UI components based on state changes. It listens to the Cubit's state and triggers a rebuild when the state changes.

### BlocConsumer

BlocConsumer separates the UI components for rendering and handling state changes. It allows for a more organized and modular approach to building UIs with BLoC.

Feel free to explore the code and understand how these concepts come together to manage the state of the Basketball Counter App.
