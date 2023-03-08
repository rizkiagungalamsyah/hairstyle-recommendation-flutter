import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Result'),
          centerTitle: true,
          backgroundColor: Colors.black),
    );
  }
}
