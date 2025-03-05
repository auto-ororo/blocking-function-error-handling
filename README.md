# blocking-function-error-handling

This is a sample application that reproduces the issue reported at https://github.com/firebase/firebase-ios-sdk/issues/14482.

## Prerequisites

- Node.js v20.16.0 or later
- Python 3.10
- Firebase CLI 13.32.0 or later
- Xcode 16.0 or later

## How to setup

1. Navigate to cloud functions directory.

   ```bash
   cd blocking-function-error-handling/functions
   ```

2. Create virtual python environment and activate it.

   ```bash
   py -3.10 -m venv venv
   source venv/bin/activate
   ```

3. install dependencies.

   ```bash
   pip install -r requirements.txt
   ```

4. Start the emulator.

   ```bash
   firebase emulators:start
   ```

5. Open `BlockingFunctionErrorHandlingSampleApp/BlockingFunctionErrorHandlingSampleApp.xcodeproj` in Xcode

6. Run the `BlockingFunctionErrorHandlingSampleApp` Target on a **simulator**.

## How to reproduce

1. In the app, enter email and password and tap on the `SignUp` button.
   - You need to enter an unregistered email.
2. The app will receive an error(HttpsError) raised by the blocking function.
   - You catch an error do not contain HttpsError.code or HttpsError.details
