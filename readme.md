# Build instructions

To build and run this app, it is necessary to have [xCode](https://apps.apple.com/us/app/xcode/id497799835) installed, so before proceeding to "actual" building steps, make sure you have it :]

1. Open xCode

---

2. On opening prompt select Clone Git Repository

---

3. Paste repository URL [ `https://github.com/WojciechCzechowski-SmartFrame/ColourFlicker_SwiftUI_iOS` ] in the search bar and click Clone

---

4. Install iOS Simulator runtime (as the described [here](https://developer.apple.com/documentation/xcode/installing-additional-simulator-runtimes)):

   > Choose Xcode > Settings > Platforms to see a list of Simulator runtimes that are currently installed and available to download. Xcode shows the amount of storage you can recover if you remove an installed Simulator runtime, and displays Built-In for a Simulator runtime that Xcode requires.

   ...

   > To install the current version of a Simulator runtime, click its Get button. For previous versions, click the Add button (+) in the lower left corner, and then select a platform to view a list of its available versions. Select a version, and click Download & Install. You can run projects on previous versions of the Simulator runtime, but you need to install the current version to build them.

---

5. Select one of the ios Simulators as destination device in **Product** -> **Destination**

---

6. Run the project by clicking **Product** -> **Run** in the top menu bar.
