import 'package:flashy/feature/flash/views/flash/widgets/flush_view_body.dart';
import 'package:flutter/material.dart';

class FlashView extends StatelessWidget {
  const FlashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: FlashViewBody(),
    );
  }
}
