# Quiz App

A Flutter application with two quiz modules that allows users to answer questions and view their results. This app is built in Android Studio and is hosted on GitHub.

## 📜 Project Overview

The **Quiz App** is a dynamic and gamified application that combines professionalism with an engaging user experience. It includes the following features:

## 🎥 Video Walkthrough

[Click here to view the video walkthrough](https://drive.google.com/file/d/1F6ydqMgzhgkxUAiJZW8I0LhFiaNW12cl/view?usp=sharing)

### Key Features
1. **App Icon and Splash Screen**:
   - The app icon prominently displays the application logo.
   - A beautifully designed splash/launching screen showcases the logo to leave a lasting first impression.

2. **Authentication**:
   - **Register/Login Screen**: 
     - Utilizes animated, user-friendly container widgets.
     - Includes mandatory fields to ensure comprehensive user data.
     - Features a "Create an Account" button in the login view, navigating to the signup screen.
     - Handles "Forgot Password?" cases, with future plans for implementing verification codes.
     - Handles the validation of email address, the matching between password and password confirmation, and required fields to be filled.
     - Red SnackBar used with an error message, and green SnackBar for successful validation.

3. **Quiz Modules**:
To enhance user excitement and engagement.
   - **MCQ Quiz**:
     - Fetches data dynamically from an API endpoint (https://api.jsonserve.com/Uw5CrX)
     - Seamlessly integrates API data with an intuitive user interface.
   - **True/False Quiz**:
     - Built using local data stored within the project.

5. **Gamification and Enhanced Features**:
   - **Interactive Timer**: A countdown timer keeps users engaged and builds suspense, turning its color to red when only 5 seconds remain, creating a sense of urgency and excitement.
   - **Animated Favorite Icon**: The favorite icon is dynamically animated, providing visual feedback by dancing and changing color to red upon correct answers, adding an engaging layer of interactivity.
   - **Immersive Sound Effects**:
     - A celebratory sound plays for correct answers, enhancing the reward experience.
     - A distinct sound indicates incorrect answers, with an option to reveal the correct answer, making the experience more educational and engaging.
     - An alert sound when only 5 seconds remain, creating a sense of urgency and excitement.
   - **Dynamic Navigation Buttons**:
     - "Next" and "Show Answer" buttons are intelligently displayed only after the timer ends or the user submits an answer, ensuring focus and anticipation during gameplay.
   - **Gamified Progress Bar**:
     - A visually appealing progress bar adds a game-like flow, motivating users to advance and complete quizzes while tracking their performance.
   - **Progress Descriptive Row**:
      - For each question, a set of icons is displayed to indicate the status of the user's answer:
      - Red False Icon (Cross): If the user selects an incorrect answer.
      - Green Check/Tick Icon: If the user selects the correct answer.
      - Question Mark Icon: If the user skips the question without answering, or the time is up.

---

## 🛠️ Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository-link>
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd <repository-folder>
   ```

3. **Install Flutter Dependencies**:
   Ensure you have Flutter installed. Run:
   ```bash
   flutter pub get
   ```

4. **Run the App**:
   Use the command:
   ```bash
   flutter run
   ```

5. **Setup the API**:
   - Ensure the API link `https://api.jsonserve.com/Uw5CrX` is active and contains valid data.

---
## More UI Screens: https://drive.google.com/drive/folders/1u34DE2foG_shcrxi2aY4b0VOHUdpr_ct
![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/cc2cf3d6779fc61a2ea0682593d6a0f8ca8e0304/Purple%20Pink%20Gradient%20Mobile%20Application%20Presentation%20(1).png)
## 📱 Screenshots

### App Icon
![app icon](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/55fa6d32a59a8add6793f1116a5aa2fcfdeeaad0/Screenshot_2025-01-25-21-29-51-370_com.miui.videoplayer.jpg)

### Splash Screen
![Main Screen](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/55fa6d32a59a8add6793f1116a5aa2fcfdeeaad0/Screenshot_2025-01-25-21-29-56-543_com.miui.videoplayer.jpg)

### Sign Up Screen
![sign up](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/55fa6d32a59a8add6793f1116a5aa2fcfdeeaad0/Screenshot_2025-01-25-21-29-59-022_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/55fa6d32a59a8add6793f1116a5aa2fcfdeeaad0/Screenshot_2025-01-25-21-30-09-114_com.miui.videoplayer.jpg) ![alt](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-30-27-318_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-30-40-635_com.miui.videoplayer.jpg)

### Login Screen
![alt](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-30-57-413_com.miui.videoplayer.jpg) ![alt](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-02-279_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-04-593_com.miui.videoplayer.jpg)

### Home Screen
![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-13-541_com.miui.videoplayer.jpg)

### Module Description Screen
![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-07-403_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-15-334_com.miui.videoplayer.jpg)

### MCQ Quiz
![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-19-459_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-23-906_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-25-726_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-33-341_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-35-910_com.miui.videoplayer.jpg)

![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-41-987_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-49-047_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-53-892_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-31-57-914_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-02-480_com.miui.videoplayer.jpg)

![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-05-140_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-07-933_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-13-680_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-21-097_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-30-782_com.miui.videoplayer.jpg)

![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-34-851_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-32-52-605_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-33-08-373_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-33-20-008_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-33-22-516_com.miui.videoplayer.jpg)

### MCQ Result Summary
![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-33-25-370_com.miui.videoplayer.jpg)

### True/False Quiz
![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-34-35-962_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-34-40-281_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-36-25-920_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-36-39-370_com.miui.videoplayer.jpg) ![](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-36-41-449_com.miui.videoplayer.jpg)

### True or False Result Summary
![Results Summary](https://github.com/LogainHamdan/Multi-Modules-Flutter-Quiz-App/blob/aaaadf4422b0288d7c33e980f133a696e9e1da6f/Screenshot_2025-01-25-21-35-34-885_com.miui.videoplayer.jpg)

---

## 📧 Contact

If you have any questions or suggestions, feel free to contact me:

**GitHub**: [LogainHamdan](https://github.com/LogainHamdan)

**Email**: logain.s.m.hamdan@gmail.com

---.
