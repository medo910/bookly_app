import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellowAccent),
        const SizedBox(width: 6.3),
        const Text('4.8', style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text(
          '(2212)',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
