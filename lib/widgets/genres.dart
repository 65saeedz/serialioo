import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    super.key,
    required this.genre,
  });

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 9),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Text(genre),
    );
  }
}
