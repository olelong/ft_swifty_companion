# ft_swifty_companion

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


<h1>
  <img src="assets/load.png" width="50px" /> Ft Swifty Companion
</h1>

A solo project. This project is a mobile application that consumes the 42 API to retrieve and display student profile information. The goal is to build a clean, responsive app with at least two views:
  - First view (search): the user enters a login and submits a search.
  - Second view (profile): if the login exists, the app displays the student's information. A navigation option allows the user to go back to the search view.

---
<h2> Details </h2>

**Examples of the First view (search):**
<div align="center">
 <img src="screenshots/fruitTheme.png" width="500px" />
</div>


**The profile view shows:**
- the user's profile picture and at least four personal details (e.g. login, email, mobile, level, location, wallet, evaluations);
- the user's skills, with their level and percentage;
- the projects the user has taken part in, including failed ones.
Examples:
<div align="center">
 <img src="screenshots/fruitTheme.png" width="500px" />
</div>

Other requirements:
- **Error handling:** The app must gracefully handle every failure case, such as an unknown login or a network error, and give the user clear feedback.
- **UI:** The interface must rely on a flexible, modern layout technique so that it renders correctly across different screen sizes and mobile platforms.
- **API usage:** The app must not generate a new authentication token for each request. The token should be obtained once and reused (and renewed only when needed).

**Mise en situation test:**
<div align="center">
  <video src="https://github.com/user-attachments/assets/59d0837b-480f-42d5-874b-bac95c14e7ed" >
    Your browser does not support videos but you can watch the T-Spin demo <a href="https://github.com/user-attachments/assets/59d0837b-480f-42d5-874b-bac95c14e7ed" >here</a>.
  </video>
</div>

---
<h2> Prerequisites </h2>

---
<h2>
   <img src="src/assets/fruitsTheme/orange.png" width="30px" /> 
  Setup Instructions
</h2>

### Step 1: Clone and Set Up the repository
1. Clone this repository:
    ```bash
   git clone git@github.com:olelong/red-tetris-frontend.git
   cd red-tetris-frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the frontend server:
   ```bash
   npm run start
   Y // Would you like to run the app on another port instead? › (Y/n)
   ```

The frontend will be accessible at:
- **http://localhost:3001** (when run standalone)
- **http://localhost:3000** (if served statically by the backend).

---
<h2>
  <img src="src/assets/fruitsTheme/myrtille.png" width="30px" />
  Technologies Used
</h2>

## Technologies Used
- **Frontend**:
<div align="left">
  <img src="screenshots/react.png" width="200px" />
  <img src="screenshots/redux.png" width="200px" />
</div>
  
- **Backend**: (no database or API involved)
<div align="left">
  <img src="screenshots/socketio.png" width="200px" />
  <img src="screenshots/nest.png" width="200px" />
</div>

---
<h2> License </h2>

This project is licensed under the MIT License - see the license file for details.

---

Enjoy the App!
