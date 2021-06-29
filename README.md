![Aperii Logo](https://github.com/Aperii/aperii-web/blob/main/public/logo.png)

This is the mobile application for Aperii, a social networking site. The app is made using Flutter, a framework built on Dart.


## Installing the App
For right now there is no "official" way to install the app via Google Play or F-Droid but you can go under the Release tab and download the .apk file that matches your architecture (if you don't know what architecture you use, it's most likely arm64)

## Building the App
### Command Line (Does Not Install to Device)
If you want to build the app without installing it to your device, you can clone the repository, open it in a preferred editor, I use Android Studio, and open a terminal and type `flutter build apk --split-per-abi`, then you can go to `.\build\app\outputs\apk\release` and you should find the APKs there, to build an appbundle, you can run `flutter build appbundle` and it'll be in `.\build\app\outputs\bundle\release`.

### Command Line (Installs to Device)
If you wish to install the app to your device, you can just run `flutter run lib/main.dart` and if it detects a connected device, it should run it.

### GUI (Installs to Device)
Through the GUI in Android Studio, you can directly run it and install it to your device. All you have to do is have a AVD (Android Virtual Device) installed, or connect your phone via ADB and it should detect it just fine, then click Run and it should begin building and installing it to your phone.

#### Requirements
- This app was written using Flutter SDK v2.2.2 and Dart SDK v2.13.3.
- [NOTICE] As of now, the app is Android only until either developer can get a Mac and developer license in order to sign the app for the App Store. ETA on that is N/A as of right now. Soon™.
- Libraries can be found in pubspec.yaml if you're curious about the libraries used, and in order to install them you just run `flutter pub get`.