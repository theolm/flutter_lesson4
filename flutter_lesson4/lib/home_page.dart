import 'package:flutter/material.dart';
import 'package:flutter_lesson4/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Mobile'),
      ),
      body: Container(),
    );
  }
}
