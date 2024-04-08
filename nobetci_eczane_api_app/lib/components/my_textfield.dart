import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const MyTextField({super.key, required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: name,
        ),
      ),
    );
  }
}
