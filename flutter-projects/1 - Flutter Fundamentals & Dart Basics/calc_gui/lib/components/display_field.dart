import 'package:flutter/material.dart';


class DisplayField extends StatelessWidget {
  final TextEditingController controller;

  const DisplayField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}