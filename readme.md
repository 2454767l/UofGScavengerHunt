# A U of G Scavenger Hunt for social bonding and campus exploration

## Description

Welcome, this is a prototype of a Scavenger Hunt location-based game set around the University of Glasgow campus developed as part of my level 4 Computing Science Dissertation Project at the University of Glasgow.

The implementation file structure follows a standard Flutter File structure. The Flutter application is made up of all of the files encapsulated within the "TreasureHunt-master" Folder. Key folders and files are as follows:
- Assets folder: This contains various asset data used within the application such as fonts and images.
- lib folder: This contains all the implemented dart code.
- pubspec.yaml: Contains various project meta data as well as the various dependencies required to run the application.

##Implementation outline

The most important file is the main.dart file. This is the source where the application is run from. It functions by calling the root method to determine what page the user should be taken to on start up. For more information on how the root is used in this software application see chapter in dissertation.

The second most important folder is the 'screens' folder, storing visual screens presented to the user as the UI. Within 'screens' can be found each of the screens of the application, each stored within seperate folders and sub folders where required to keep the project tidy.


Additionally, folder explainations are as follows:
- The 'controllers' folder contains controllers for each of the challenge screens. See implementation section 6.3 of the dissertation for more information on Flutter controllers.

- The 'models' folder provides models for various parts of the application.

- The 'services' folder contains the database functionality.

- The 'states' folder contains implementation for managing the application state of the current user.

- The 'utils' folder contains application theme data.

### Requirements

List the all of the pre-requisites software required to set up your project (e.g. compilers, packages, libraries, OS, hardware)

For example:

* Python 3.7
* Packages: listed in `requirements.txt` 
* Tested on Windows 10

or another example:

* Requires Raspberry Pi 3 
* a Linux host machine with the `arm-none-eabi` toolchain (at least version `x.xx`) installed
* a working LuaJIT installation > 2.1.0

### Build steps

To In the command prompt, navigate to the project directory and enter the following command into your command prompt to install the required modules:
- `flutter pub get'

List the steps required to build software. 

Hopefully something simple like `pip install -e .` or `make` or `cd build; cmake ..`. In
some cases you may have much more involved setup required.

## Build instructions

**You must** include the instructions necessary to build and deploy this project successfully. If appropriate, also include 
instructions to run automated tests. 

- The application should be run from it's source, 'main.dart' file using an IDE such as Android Studio using a specified android device. 

- Alternatively, this can be done by navigating to the 'TreasureHunt-master' directory and running the following command: 'flutter run' using a specified android device.

Examples:

* Run automated tests by running `pytest`
* Start the software by running `bin/editor.exe` and opening the file `examples/example_01.bin`

