# Readme

The implementation file structure follows a standard Flutter File structure. The Flutter application is made up of all of the files encapsulated within the "TreasureHunt-master" Folder. Key folders/files are as follows:
1- Assets folder: This contains various asset data used within the application such as fonts and images.
2- lib folder: This contains all the implemented dart code.
3- pubspec.yaml: Contains various project meta data as well as the various dependencies required to run the application.

Implementation outline:

The most important file is the main.dart file. This is the source where the application is run from. It functions by calling the root method to determine what page the user should be taken to on start up. For more information on how the root is used in this software application see chapter in dissertation.

The second most important folder is the 'screens' folder, storing visual screens presented to the user as the UI. Within 'screens' can be found each of the screens of the application, each stored within seperate folders and sub folders where required to keep the project tidy.


Additionally, folder explainations are as follows:
-The 'controllers' folder contains controllers for each of the challenge screens. See implementation section 6.3 of the dissertation for more information on Flutter controllers.

-The 'models' folder provides models for various parts of the application.

-The 'services' folder contains the database functionality.

-The 'states' folder contains implementation for managing the application state of the current user.

-The 'utils' folder contains application theme data.


## Build instructions

**You must** include the instructions necessary to build and deploy this project successfully. If appropriate, also include 
instructions to run automated tests. 

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

List the steps required to build software. 

Hopefully something simple like `pip install -e .` or `make` or `cd build; cmake ..`. In
some cases you may have much more involved setup required.

### Test steps

List steps needed to show your software works. This might be running a test suite, or just starting the program; but something that could be used to verify your code is working correctly.

Examples:

* Run automated tests by running `pytest`
* Start the software by running `bin/editor.exe` and opening the file `examples/example_01.bin`

