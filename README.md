<h1>
  <img src="assets/load.png" width="50px" /> Ft Swifty Companion
</h1>

A solo project. This project is a mobile application that consumes the 42 API to retrieve and display student profile information. The goal is to build a clean, responsive app with at least two views:
  - First view (search): the user enters a login and submits a search.
  - Second view (profile): if the login exists, the app displays the student's information. A navigation option allows the user to go back to the search view.

---
<h2> Details </h2>

**Example of the First view (search):**
<div align="left">
 <img src="Screenshots/Home.png" height="400px" />
</div>


**The profile view shows:**
- the user's profile picture and at least four personal details (e.g. login, email, mobile, level, location, wallet, evaluations);
- the user's skills, with their level and percentage;
- the projects the user has taken part in, including failed ones.
Examples:
<div align="left">
  <tr>
    <td>
      <img src="Screenshots/Projects.png" height="400px" />
    </td>
    <td>
      <img src="Screenshots/Skills.png" height="400px" />
    </td>
  </tr>
</div>

Other requirements:
- **Error handling:** The app must gracefully handle every failure case, such as an unknown login or a network error, and give the user clear feedback.
- **UI:** The interface must rely on a flexible, modern layout technique so that it renders correctly across different screen sizes and mobile platforms.
- **API usage:** The app must not generate a new authentication token for each request. The token should be obtained once and reused (and renewed only when needed).

**Mise en situation test:**
<table align="center">
  <tr>
    <td>
      <video src="https://github.com/user-attachments/assets/2ed4865e-358a-47cc-8121-8ef353a000cf" controls> Your browser does not support videos but you can watch the demo part 1 <a href="https://github.com/user-attachments/assets/2ed4865e-358a-47cc-8121-8ef353a000cf" >here</a>
      </video>
    </td>
    <td>
      <video src="https://github.com/user-attachments/assets/3134a972-1e88-47ce-9f50-047ff1204c69" controls>
        Your browser does not support videos but you can watch the demo part 2 <a href="https://github.com/user-attachments/assets/3134a972-1e88-47ce-9f50-047ff1204c69" >here</a>
      </video>
    </td>
  </tr>
</table>

---
<h2> Prerequisites </h2>
Flutter, Android studio si besoin pour émuler.

---
<h2> Setup Instructions </h2>

### Step 1: Clone the repository
1. Clone this repository:
    ```bash
   git clone git@github.com:olelong/ft_swifty_companion.git
   cd ft_swifty_companion
   ```
### Step 2: Install Flutter (if not already installed)
1. Download flutter zip:
   https://docs.flutter.dev/get-started/install/linux/android or https://docs.flutter.dev/install/manual
2. Create a folder dedicated (this step line is only for 42 users):
   Create a folder dev in sgoinfre or goinfre.
   ```
      mkdir dev
   ```
5. Extract the zip file:
   ```
   tar -xf ~/Downloads/flutter_linux_3.35.2-stable.tar.xz -C ~/goinfre/dev/
   ```
7. Add to PATH env:
  ```
   echo 'export PATH="$HOME/goinfre/dev/flutter/bin:$PATH"' >> ~/.zshenv
  ```
(  Same command line for bash instead of zshrc but at the end: >>  ~/.bash_profile )
8. Relaunch the terminal

### Step 3: Launch
1. To run the app:
  ```
  flutter run -d emulator-5554 --dart-define=API_URL="https://api.intra.42.fr" --dart-define=CLIENT_ID="" --dart-define=CLIENT_SECRET=""
  ```
3. To build the app:
```
  flutter build apk --release --dart-define=API_URL="https://api.intra.42.fr" --dart-define=CLIENT_ID="" --dart-define=CLIENT_SECRET=""
```

---
<h2> Technologies Used </h2>

## Technologies Used
 Framework Flutter to create an app usable on every platform, and Android studio for emulation.
<div align="left">
  <img src="Screenshots/FlutterLogo.png" width="100px" />
  <img src="Screenshots/androidStudioLogo.png" width="100px" />
</div>

---
<h2> License </h2>

This project is licensed under the MIT License - see the license file [LICENSE](LICENSE) for details.

---

Enjoy the App!
