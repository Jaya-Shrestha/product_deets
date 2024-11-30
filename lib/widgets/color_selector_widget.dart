import 'package:flutter/material.dart';
import 'package:softbenz_task/model/product_model.dart';
import 'package:softbenz_task/widgets/title_value_widget.dart';

class ColorCodeSelectorWidget extends StatefulWidget {
  const ColorCodeSelectorWidget({required this.productInfo, super.key});

  final ProductData productInfo;

  @override
  State<ColorCodeSelectorWidget> createState() => _ColorCodeSelectorWidgetState();
}

class _ColorCodeSelectorWidgetState extends State<ColorCodeSelectorWidget> {
  String? selectedColorName;

  @override
  Widget build(BuildContext context) {
    final defaultColorName = widget.productInfo.colorVariants.first.color.name;
    final displayedColorName = selectedColorName ?? defaultColorName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and Selected Color Name
        TitleValueWidget(
          title: 'Color',
          value: '($displayedColorName)',
          width: 50,
        ),
        const SizedBox(height: 8.0),

        // Color Selection Chips
        Wrap(
          spacing: 8,
          children: widget.productInfo.colorVariants.map((colorVariant) {
            final colorValueHex = colorVariant.color.colorValue.first.substring(1, 7);
            final colorCode = int.parse(colorValueHex, radix: 16) + 0xFF000000;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorName = colorVariant.color.name;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColorName == colorVariant.color.name
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Color(colorCode),
                  radius: 16, // Adjust radius for consistent size
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
