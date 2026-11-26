import 'package:flutter/material.dart';

import '../../../../core/utils/size_utils.dart';

class CustomDateTimeWidget extends StatelessWidget {
  final IconData icon;
  final String eventDateOrTime;
  final VoidCallback onPressed;
  final String chooseDateOrTime;

  const CustomDateTimeWidget({
    super.key,
    required this.icon,
    required this.eventDateOrTime,
    required this.chooseDateOrTime,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Row(
      spacing: width * 0.04,
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 25),
        Text(
          eventDateOrTime,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            chooseDateOrTime,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              decorationColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
