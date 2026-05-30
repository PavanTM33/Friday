#!/bin/bash
# ============================================================
#  J.A.R.V.I.S — APK Builder
#  Builds a native Android APK from the PWA using Capacitor
# ============================================================
set -e

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   J.A.R.V.I.S  APK  BUILDER  v1.0       ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# --- REQUIREMENTS CHECK ---
check_cmd() {
  if ! command -v "$1" &>/dev/null; then
    echo "✗ Missing: $1 — $2"
    exit 1
  else
    echo "✓ $1 found"
  fi
}

echo "[ CHECKING REQUIREMENTS ]"
check_cmd node     "Install from https://nodejs.org (v18+)"
check_cmd npm      "Comes with Node.js"
check_cmd java     "Install JDK 17: https://adoptium.net"

NODE_V=$(node -v | tr -d 'v' | cut -d. -f1)
if [ "$NODE_V" -lt 18 ]; then
  echo "✗ Node.js 18+ required (found v$NODE_V)"
  exit 1
fi
echo ""

# --- INIT NPM ---
echo "[ INITIALIZING PROJECT ]"
if [ ! -f package.json ]; then
  npm init -y > /dev/null
fi

# --- INSTALL CAPACITOR ---
echo "[ INSTALLING CAPACITOR ]"
npm install @capacitor/core @capacitor/cli @capacitor/android --save 2>&1 | tail -3

# --- CAPACITOR CONFIG ---
echo "[ WRITING CAPACITOR CONFIG ]"
cat > capacitor.config.json << 'CAPEOF'
{
  "appId": "com.jarvis.ai.assistant",
  "appName": "JARVIS",
  "webDir": ".",
  "server": {
    "androidScheme": "https"
  },
  "android": {
    "allowMixedContent": true,
    "backgroundColor": "#000000"
  },
  "plugins": {
    "SplashScreen": {
      "launchShowDuration": 2000,
      "backgroundColor": "#000000",
      "androidScaleType": "CENTER_CROP",
      "showSpinner": false
    }
  }
}
CAPEOF

# --- INIT ANDROID ---
echo "[ INITIALIZING ANDROID PROJECT ]"
npx cap init JARVIS com.jarvis.ai.assistant --web-dir . 2>/dev/null || true
npx cap add android 2>&1 | tail -5

# --- COPY ASSETS ---
echo "[ SYNCING WEB ASSETS ]"
npx cap sync android 2>&1 | tail -5

# --- PATCH ANDROID PERMISSIONS ---
echo "[ PATCHING ANDROID MANIFEST ]"
MANIFEST="android/app/src/main/AndroidManifest.xml"
if [ -f "$MANIFEST" ]; then
  # Add required permissions before </manifest>
  sed -i 's|</manifest>|    <uses-permission android:name="android.permission.INTERNET" />\n    <uses-permission android:name="android.permission.RECORD_AUDIO" />\n    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />\n    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />\n</manifest>|' "$MANIFEST"
  echo "✓ Permissions patched"
fi

# --- BUILD DEBUG APK ---
echo ""
echo "[ BUILDING DEBUG APK ]"
echo "  (This may take 3-5 minutes on first run...)"
echo ""

cd android

if [ ! -f gradlew ]; then
  echo "✗ Gradle wrapper not found"
  exit 1
fi

chmod +x gradlew
./gradlew assembleDebug --quiet 2>&1 | tail -10

APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
  DEST="../JARVIS-v1.0-debug.apk"
  cp "$APK_PATH" "$DEST"
  SIZE=$(du -sh "$DEST" | cut -f1)
  echo ""
  echo "╔══════════════════════════════════════════╗"
  echo "║   ✓  BUILD SUCCESSFUL                    ║"
  echo "╠══════════════════════════════════════════╣"
  echo "║   APK: JARVIS-v1.0-debug.apk            ║"
  echo "║   Size: $SIZE                             ║"
  echo "╚══════════════════════════════════════════╝"
  echo ""
  echo "  Install on device:"
  echo "  adb install ../JARVIS-v1.0-debug.apk"
  echo ""
  echo "  Or copy the APK to your phone and open it"
  echo "  (Enable 'Install from unknown sources' first)"
else
  echo "✗ Build failed. Check output above."
  exit 1
fi
