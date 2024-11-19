import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torch_light/torch_light.dart'; // Import Timer

class FlashCubit extends Cubit<bool> {
  FlashCubit() : super(false); // Flash is initially off
  Timer? _timer;
  bool _isAutoToggleRunning =
      false; // State to determine if auto-toggle is running

  // Toggle flashlight on and off
  Future<void> toggleTorch() async {
    if (state) {
      await TorchLight.disableTorch();
    } else {
      await TorchLight.enableTorch();
    }
    emit(!state); // Change the state after toggling
  }

  // Start auto-toggle every second
  void startAutoToggle() {
    if (_isAutoToggleRunning) {
      // If auto-toggle is already running, do nothing
      return;
    }
    _isAutoToggleRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      toggleTorch(); // Toggle the flashlight every second
    });
  }

  // Stop auto-toggle
  void stopAutoToggle() {
    _timer?.cancel();
    _timer = null;
    _isAutoToggleRunning = false; // Update auto-toggle state
  }

  // Toggle between starting and stopping auto-toggle
  void toggleAutoToggle() {
    if (_isAutoToggleRunning) {
      stopAutoToggle(); // If auto-toggle is running, stop it
    } else {
      startAutoToggle(); // If it is stopped, start it
    }
  }

  bool get isAutoToggleRunning =>
      _isAutoToggleRunning; // Get the auto-toggle state
}
