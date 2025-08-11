import 'package:flutter/material.dart';

class TickersListItemLeading extends StatelessWidget {
  const TickersListItemLeading({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
    );
  }
}
