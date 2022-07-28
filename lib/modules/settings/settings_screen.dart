// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
