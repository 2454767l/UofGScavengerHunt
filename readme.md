# A U of G Scavenger Hunt for social bonding and campus exploration

## Description

Welcome, this is a prototype of a Scavenger Hunt location-based game set around the University of Glasgow campus developed as part of my level 4 Computing Science Dissertation Project at the University of Glasgow.

The implementation file structure follows a standard Flutter File structure. The Flutter application is made up of all of the files encapsulated within the "TreasureHunt-master" Folder. Key folders and files are as follows:
- Assets folder: This contains various asset data used within the application such as fonts and images.
- lib folder: This contains all the implemented dart code.
- pubspec.yaml: Contains various project meta data as well as the various dependencies required to run the application.

## Implementation outline

The most important file is the main.dart file. This is the source where the application is run from. It functions by calling the root method to determine what page the user should be taken to on start up.

The second most important folder is the 'screens' folder, storing visual screens presented to the user as the UI. Within 'screens' can be found each of the screens of the application, each stored within seperate folders and sub folders where required to keep the project tidy.


Additionally:
- The 'controllers' folder contains controllers for each of the challenge screens. See implementation section 6.3 of the dissertation for more information on Flutter controllers.

- The 'models' folder provides model data for various parts of the application.

- The 'services' folder contains the database functionality.

- The 'states' folder contains implementation for managing the application state of the current user.

- The 'utils' folder contains application theme data.

### Requirements

Tools, Packages and Flutter Plugins required to sucessfully install this project.
- `Flutter version 3.0.5`
- `Dart version 2.17.6`
- `DevTools version 2.12.2` 
- `cloud_firestore: 4.2.0`
-  `firebase_auth: 4.2.0`
-  `provider: 6.0.4`
-  `google_maps_flutter: 2.1.7`
-  `location: 4.4.0`
-  `flutter_svg: 1.1.6`
-  `get: 4.6.5`
-  `auto_size_text: 3.0.0`
-  `liquid_pull_to_refresh: 3.0.1`
- `cupertino_icons: 1.0.2`
- `Android device or Emulator equivalent.`

### Build steps

In the chosen IDE command prompt, navigate to the project directory and enter the following command into your command prompt to install the required modules:
- `flutter pub get'


## Build instructions

- The application should be run by navigating to the 'TreasureHunt-master' directory and running the following command: `flutter run` using a specified android device.

- Alternatively, this can be done by running main.dart using an IDE such as Android Studio (recommended) using a specified android device. 

Note: You may be prompted to select a device to run it on if it has not identified it already.
