import 'package:flutter/material.dart';

class InfoIconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoIconTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 5,
        children: [
          Icon(icon, size: 30, color: Theme.of(context).colorScheme.outline),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
