import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({required this.title, required this.value, super.key});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    String parseHtmlToText(String htmlString) {
      final document = parse(htmlString);
      return document.body?.text ?? '';
    }

    String plainText = parseHtmlToText(value);
    final dataList = plainText.split('.');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        collapsedBackgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(title),
        initiallyExpanded: false,
        onExpansionChanged: (value) {},
        children: [
          for (final data in dataList)
            Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.topLeft,
              child: Text(data),
            )
        ],
      ),
    );
  }
}
