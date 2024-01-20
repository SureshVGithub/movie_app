import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieListTitle extends StatelessWidget {
  MovieListTitle({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        textAlign: TextAlign.left,
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
