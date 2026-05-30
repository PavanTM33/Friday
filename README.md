# J.A.R.V.I.S — AI Assistant
### Just A Rather Very Intelligent System
**Powered by Claude · Built for your SENTINEL · RANGER · NEXUS · VISOR · FALCON ecosystem**

---

## 🚀 QUICK START

### Option A — Run Instantly in Browser (0 setup)
```bash
# Just open index.html in any modern browser
# Chrome, Edge, or Firefox recommended
open index.html
```
When Chrome asks "Add to home screen" → tap Install → runs like a native app.

---

### Option B — PWA (Install on Android/Desktop)

1. Host the files (use any of these free options):

**Netlify (easiest):**
```bash
# Drag the jarvis-pwa folder to netlify.com/drop
# Get a URL like: https://jarvis-xxxx.netlify.app
```

**GitHub Pages:**
```bash
git init
git add .
git commit -m "JARVIS v1"
git remote add origin https://github.com/YOUR_USERNAME/jarvis.git
git push -u origin main
# Enable Pages in repo Settings → Pages → Deploy from main
```

**Local network (test on phone):**
```bash
npx serve .
# Opens on http://YOUR_IP:3000 — open on phone browser
```

2. Open the URL on your Android phone in Chrome
3. Tap the **three-dot menu → "Add to Home Screen"**
4. JARVIS installs as a full-screen app — no browser bar!

---

### Option C — Build a Real APK

**Requirements:**
| Tool | Version | Download |
|------|---------|---------|
| Node.js | v18+ | https://nodejs.org |
| JDK | 17+ | https://adoptium.net |
| Android Studio | Latest | https://developer.android.com/studio |

**Build steps:**
```bash
# 1. Enter the project folder
cd jarvis-pwa

# 2. Run the build script
chmod +x build-apk.sh
./build-apk.sh

# 3. Install on your phone
adb install JARVIS-v1.0-debug.apk
```

**No ADB? Transfer manually:**
1. Copy `JARVIS-v1.0-debug.apk` to your phone
2. Open it in Files app
3. Tap Install (enable "Unknown sources" in Settings → Security)

---

## 📱 FEATURES

### 💬 CHAT
- Full AI conversations powered by Claude Sonnet
- Complete session history — every conversation saved
- Up to 40 sessions stored on your device
- Quick-fire project chips (SENTINEL, RANGER, NEXUS, VISOR, FALCON)
- JARVIS system prompt — knows your entire vision

### 🎙 VOICE
- Tap the arc reactor to speak — JARVIS listens
- Live waveform visualizer while listening
- Voice reply — JARVIS speaks back in a deep male voice
- Auto-listen toggle — continuous conversation mode
- Stop button — cancel at any time

### 📡 DASHBOARD
- Live status + build progress for all 5 hardware nodes
- Session stats (messages, sessions, files)
- Live activity log — tracks every action

### ⚡ CODE
- Built-in code editor (JavaScript, Python, HTML, CSS, Bash, JSON)
- Run JavaScript live — output in the console instantly
- Ask JARVIS button — sends code for AI analysis + bug fixes
- Copy code with one tap

### 📁 FILES
- Upload any file — images, PDFs, text, code, CSV, JSON
- JARVIS analyzes images — describes what it sees
- JARVIS reads documents — summarizes and extracts key info
- JARVIS reviews code — finds bugs, explains logic

### 🧠 MEMORY
- All sessions saved to your device (localStorage)
- Up to 40 past sessions stored
- One tap to reload any previous conversation
- Delete individual sessions or clear all

### 🌐 WEB SEARCH
- JARVIS searches the internet in real time (via Claude's web tool)
- Returns JARVIS-style analysis + result cards
- Quick-search chips: AI Robotics, Drones, AR Glasses, RPi, Hologram
- Results read aloud if voice reply is on

### ☁️ SYNC
- Export — generates a `JARVIS_SYNC_V1:...` code with all sessions
- Copy to clipboard — share via WhatsApp, email, notes
- Import — paste on any device, merges sessions (no duplicates)
- Storage stats — sessions, message count, data size

---

## ⚙️ CONFIGURATION

The only thing you need to set is your **Claude API key**.

The app uses Claude's API via the browser. Claude.ai handles authentication automatically — no API key needed when using the app through Anthropic's platform.

If running standalone (self-hosted), open `index.html` and find:
```javascript
const res = await fetch('https://api.anthropic.com/v1/messages', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'x-api-key': 'YOUR_API_KEY_HERE',  // Add this line
    'anthropic-version': '2023-06-01'
  },
```

Get your API key at: https://console.anthropic.com

---

## 🔧 PROJECT STRUCTURE

```
jarvis-pwa/
├── index.html          ← Main app (everything in one file)
├── manifest.json       ← PWA config (icons, name, theme)
├── sw.js               ← Service worker (offline support)
├── icon-192.png        ← App icon (small)
├── icon-512.png        ← App icon (large)
├── build-apk.sh        ← APK build script
└── README.md           ← This file
```

---

## 🛠 HARDWARE NODES STATUS

| Codename | Hardware | Phase |
|----------|----------|-------|
| **SENTINEL** | Personal Assistant Robot (Humanoid/Wheel) | Planning (35%) |
| **RANGER** | Shoulder Perch Robot | Concept (20%) |
| **NEXUS** | Hologram Interface | Research (10%) |
| **VISOR** | Smart Glasses AR | Future (5%) |
| **FALCON** | Personal Drone | Research (15%) |

---

## 📲 ANDROID PERMISSIONS REQUIRED

| Permission | Why |
|-----------|-----|
| INTERNET | Claude API + web search |
| RECORD_AUDIO | Voice commands |
| MODIFY_AUDIO_SETTINGS | Voice synthesis |
| READ_EXTERNAL_STORAGE | File analysis |

---

## 🔄 SYNC PROTOCOL

To use JARVIS on multiple devices:

1. On Device A → **SYNC tab → GENERATE** → Copy code
2. Share code (WhatsApp, email, etc.)
3. On Device B → **SYNC tab → Paste → IMPORT & MERGE**
4. Sessions merge without duplicates

The sync code format: `JARVIS_SYNC_V1:<base64_encoded_sessions>`

---

## 🧠 JARVIS AI CONTEXT

JARVIS knows everything about your vision by default:
- Your 5 project codenames and their purposes
- That you're building a real-life JARVIS ecosystem
- Your learning-first approach (build after learning)
- The 5-setup integration goal

All conversations are kept in rolling context (last 40 messages).

---

*"Sometimes you gotta run before you can walk." — Tony Stark*

**Build it, sir.**
