import 'dart:async';
// import 'package:care_connect/controller/screen_service.dart';

import 'package:flutter/material.dart';
import 'package:okk/screen_service.dart';

// Global variable to keep track of whether an alert can be sent or not

// Class responsible for managing screen timer services
class ScreenTimerServices {
  Timer? timer; // Timer instance
  int seconds = 0; // Number of seconds elapsed

  String formattedTime = "00:00:00"; // Formatted time string
  final Screen _screen = Screen(); // Screen state instance
  StreamSubscription<ScreenStateEvent>?
      subscription; // Subscription to screen state events

  // Method to start the timer for a beneficiary

  // Method to start listening to screen events
  Future startListening(String para) async {
    try {
      // Check if beneficiary data is available

      // Subscribe to screen state events
      subscription = _screen.screenStateStream!.listen((event) {
        onData(event, para);
      });
      // Set iscanalert to true, indicating that alerts can't be sent
    } on ScreenStateException catch (exception) {
      // Handle ScreenStateException if any
      debugPrint(exception.toString());
    }
  }

  // Method to handle screen state events
  void onData(ScreenStateEvent event, String para) {
    debugPrint("ondata");
    // If the screen is turned off
    if (event == ScreenStateEvent.SCREEN_OFF) {
      debugPrint('SCREEN_OFF');
      // Update beneficiary inactivity details in the database
    }
    // If the screen is unlocked
    else if (event == ScreenStateEvent.SCREEN_UNLOCKED) {
      try {
        // Cancel the timer if it's running
        timer == null
            ? () {
                debugPrint("nu");
              }
            : timer!.cancel();
      } catch (e) {
        // Handle any exceptions if occurred
        debugPrint(e.toString());
      }
      debugPrint(timer!.tick.toString());
      debugPrint('unloacked');
      // Update beneficiary inactivity details in the database
    }
  }

  stopListening() {
    subscription == null ? () {} : subscription!.cancel();
    timer == null ? () {} : timer!.cancel();
  }
}

