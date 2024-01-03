# Project Title: AI Assistant Mobile Application

---

### Table of Contents
1. [Overview](#overview)
2. [Installation](#installation)
3. [Setting Up API Keys](#setting-up-api-keys)
4. [Features](#features)
5. [Usage](#usage)
6. [Contributors](#contributors)
7. [License](#license)

---

<a name="overview"></a>
### Overview
The AI Assistant mobile application is an innovative solution that integrates various AI services such as ChatGPT, Dall-E, Image to Text, and Voice Assistant into a single, user-friendly interface. This project aims to provide easy access to advanced AI features through a modular and intuitive mobile application.

---

<a name="installation"></a>
### Installation
To install and run the application, follow these steps:
1. Clone the repository: `git clone [repository URL]`.
2. Navigate to the project directory: `cd ai-assistant-app`.
3. Install dependencies: `flutter pub get`.
4. Build the application: `flutter build apk` (for Android) or `flutter build ios` (for iOS).

---

<a name="setting-up-api-keys"></a>
### Setting Up API Keys
For the application to function correctly, you need to set up API keys for different services:
1. **DALL-E and ChatGPT API Key:** Obtain the keys from [OpenAI](https://openai.com/).
   - <img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/de200e99-1ea8-48e8-9a22-1de00cb019ed" width="250">
   - <img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/0c5961cf-fc8b-46c3-9582-9527dfb2b5f7" width="250">
   - <img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/3de8ca7c-271e-4725-bf0c-31458654302f" width="250">
     
     
3. **Setting the Key:**
    - Navigate to the `lib/shared/openai_api.dart` directory.
    - You will find this snippet of code like this: const OPENAI_API_KEY = "hidden";
    - replace "hidden" with your new generated API In step 1
4. Save the file.

---

<a name="features"></a>
### Features
The application includes the following features:
- **Authintication:** Login and Register service for authintication the users.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/26b884a9-8333-4bc8-8441-c85d7dbf8a7c" width="250">
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/0362db51-2847-4b9b-b106-a7421f160c87" width="250">

- **Main Page:** Main Page showing all application features.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/52f03513-3c0d-42f6-94b0-9ca9ab9cce00" width="250">

- **ChatGPT:** Engage in natural language conversations.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/6c4e8bd1-2581-4248-946d-5dada0599428" width="250">

- **Dall-E:** Generate images from textual descriptions.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/76fe3071-97c5-4c7e-b6e2-27fd7325eac9" width="250">

- **Image to Text:** Extract text from images.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/803b9766-7582-454d-8d46-e70e74f9e56b" width="250">

- **Voice AI Assistant:** Interact using voice commands.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/eebcc8aa-cb96-42e5-9c0f-3e760587f629" width="250">

- **Side Bar Menu:** Easy navigation and user details.
<img src="https://github.com/mohammedAlmaghlouth/ai_assist/assets/65549274/812098fc-e467-45eb-8645-5978d9f4772c" width="250">

---

<a name="usage"></a>
### Usage
To use the application:
1. Launch the app on your device.
2. Log in or register a new account.
3. Navigate through the side menu to access different AI features.
4. Add openai key
5. Use each module as needed - chat, generate images, extract text from images, or use the voice assistant.

---

<a name="contributors"></a>
### Contributors
- Feras Alshateeb - Side menu, Voice AI Assistant
- Mohammed Alzowaid - Image to Text, Main Page
- Mohammed Almaghlouth - ChatGPT, Welcome Page
- Saud Alqahtani - Dall E, Login/Register

---

<a name="license"></a>
### License

