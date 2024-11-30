import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softbenz_task/model/product_model.dart';
import 'package:softbenz_task/widgets/color_selector_widget.dart';
import 'package:softbenz_task/widgets/expansion_tile_widget.dart';
import 'package:softbenz_task/widgets/images_widget.dart';
import 'package:softbenz_task/widgets/quantity_field.dart';
import 'package:softbenz_task/widgets/title_value_widget.dart';
import '../providers/product_provider.dart';

class ProductDetailPage extends ConsumerWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(productId));
    var screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 800; // Consider screen size > 800 as desktop

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "SoftBenz Infosys",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.send),
        onPressed: () => showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                "Send us a message",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              content: const TextField(
                decoration: InputDecoration(hintText: "Write your message here"),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Thank you for Contacting Us")),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Send Message"),
                ),
              ],
            );
          },
        ),
      ),
      body: productAsync.when(
        data: (product) {
          final productInfo = product.data;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductImages(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: _buildProductInfo(productInfo, context),
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductImages(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: _buildProductInfo(productInfo, context),
                      ),
                    ],
                  ),

                // Product Details (always below images/info)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ProductInfoWidget(
                    title: 'Product Description',
                    value: productInfo.description,
                  ),
                ),
                ProductInfoWidget(
                  title: 'Product Ingredient',
                  value: productInfo.ingredient,
                ),
                const SizedBox(height: 12.0),
                ProductInfoWidget(
                  title: 'How to Use',
                  value: productInfo.howToUse,
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text(
            "Error: $err",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo(ProductData productInfo, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productInfo.brand.name.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            productInfo.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        TitleValueWidget(
          title: 'Code:',
          value: productInfo.colorVariants.first.productCode,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Wrap(
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Rs.${productInfo.price}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                'Rs.${productInfo.strikePrice}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              Chip(
                label: Text('${productInfo.offPercent}% off'),
                labelStyle: const TextStyle(color: Color.fromARGB(255, 2, 121, 172), fontSize: 18.0),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
        TitleValueWidget(
          title: 'Review:',
          value: productInfo.totalRatings.toString(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ColorCodeSelectorWidget(productInfo: productInfo),
        ),
        StockQuantityWidget(minOrder: productInfo.minOrder),
        const SizedBox(height: 16.0),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Add to Cart",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
