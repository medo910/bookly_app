import 'package:flutter/material.dart';

class CsutomTextField extends StatelessWidget {
  const CsutomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: BuildOutlineInputBorder(),
        focusedBorder: BuildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

OutlineInputBorder BuildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.white),
  );
}
