# Attendance Tracker App

This is a Flutter application that lets you mark and track student attendance across two screens.
This is the assignment of my module 21.

**Developer:** Hussain Muhammad Abdullah  
**GitHub:** [github.com/hussain130607](https://github.com/hussain130607)

---

## How to Run

Make sure Flutter is set up on your machine. Then:

```bash
# 1. Clone the repo
git clone https://github.com/hussain130607/Attendance-Tracker.git
cd attendance-tracker

# 2. Install packages
flutter pub get

# 3. Run
flutter run
```

That's it. No backend, no API keys — everything runs locally.

---

## What the App Does

**Screen 1 — Attendance**  
Shows a list of 10 students. Each one has a checkbox. Tapping it marks them as Present or Absent. The state updates immediately through the provider.

**Screen 2 — Summary**  
When you hit Submit, it navigates here and shows the total count of Present and Absent students based on what was checked.

---

## How ChangeNotifier and notifyListeners() Were Used

The core of the state management lives in `AttendanceProvider`, which extends `ChangeNotifier`.

**Why ChangeNotifier?**  
Rather than calling `setState()` inside each widget, all the attendance logic is centralized in the provider class. Any widget that needs attendance data just listens to this single source of truth. This keeps things clean — the UI doesn't need to know *how* the data changes, it just knows *when* it changes.

**How notifyListeners() works here:**  
When a user taps a checkbox, `toggleAttendance(index)` flips the student's `isPresent` boolean and immediately calls `notifyListeners()`. This tells Flutter to rebuild every widget that's watching the provider. So `AttendanceScreen` re-renders the checkboxes, and `SummaryScreen` recalculates the counts — both in real time.

Without `notifyListeners()`, the data would change internally but the UI would have no idea, so nothing would update on screen.

---

## Project Structure

```
lib/
├── main.dart                        # App entry, Provider setup
├── models/
│   └── student.dart                 # Student data model
├── providers/
│   └── attendance_provider.dart     # ChangeNotifier, state logic
└── screens/
    ├── attendance_screen.dart       # Screen 1 — checkbox list
    └── summary_screen.dart          # Screen 2 — present/absent count
```

---

## Suggested Commit History

```
git commit -m "Setup project and added provider dependency"
git commit -m "Implemented attendance screen with CheckboxListTile"
git commit -m "Finalized navigation logic and summary screen"
```