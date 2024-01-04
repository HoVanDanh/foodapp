import 'package:flutter/material.dart';

class DirecotoryScreen extends StatefulWidget {
  const DirecotoryScreen({super.key});

  @override
  State<DirecotoryScreen> createState() => _DirecotoryScreenState();
}

class _DirecotoryScreenState extends State<DirecotoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('directory'),
      ),
      body: Container(
        child: Center(
          child: Text('danh muc '),
        ),
      ),
    );
  }
}