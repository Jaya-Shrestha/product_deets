import 'package:flutter/material.dart';

class TitleValueWidget extends StatelessWidget {
  const TitleValueWidget({
    required this.title,
    required this.value,
    this.textStyle,
    this.width,
    super.key,
  });

  final String title;
  final String value;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width ?? 100,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Text(
          value,
          style: textStyle ??
              Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
        ),
      ],
    );
  }
}
