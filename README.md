## Messenger

This is a clone of Meta's Messenger Application developed in Swift and SwiftUI.

**Prerequisites**

* Xcode (Download from [https://developer.apple.com/xcode/resources/](https://developer.apple.com/xcode/resources/))
* Swift (Included with Xcode)
* Cocoapods (Dependency management tool: [https://guides.cocoapods.org/using/getting-started.html](https://guides.cocoapods.org/using/getting-started.html))

**Installation**

1. Clone this repository:

   ```bash
   git clone https://github.com/mertdurkaya/Messenger.git
   ```
2. Navigate to the project directory:

   ```bash
   cd Messenger
   ```
3. Install dependencies using Cocoapods:

   ```bash
   pod install
   ```

**Configuration**

**Important:** You will need to download your own `GoogleService-Info.plist` file from the Firebase console and add it to the project manually.

1. Create a Firebase project ([https://console.firebase.google.com/](https://console.firebase.google.com/)).
2. Enable the Firebase features you need for your project (e.g., Authentication, Firestore).
3. In the Firebase console, navigate to **Project settings** -> **Your apps**.
4. Add a new app for your platform (iOS) and download the `GoogleService-Info.plist` file.
5. Drag and drop the downloaded `GoogleService-Info.plist` file into the **ios** folder within the project directory.
6. In Xcode, ensure the file is included in your target membership. Right-click on the file and select "Add Items to [Messenger]".

**Running the App**

1. Open `Messenger.workspace` in Xcode.
2. Connect your device or choose a simulator.
3. Press "Run" in Xcode.

**Note:**

* This README assumes a basic understanding of Xcode and Git.
* Remember to replace `[Messenger]` with the actual name of your app in step 5 of the configuration section.


**Additional Notes**

* Consider referring to the official Firebase documentation for detailed setup instructions: [https://firebase.google.com/docs/ios/setup](https://firebase.google.com/docs/ios/setup)
* Thanks to Stephan Dowless - www.stephancodes.com

**Contributing**

We appreciate any contributions to this project. Please follow the standard Git workflow for pull requests.
