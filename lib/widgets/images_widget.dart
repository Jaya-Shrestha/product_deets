import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  // State to track the selected image
  String selectedImage = 'lib/assets/image1.jpeg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the selected image in the bigger frame
          Image(
            image: AssetImage(selectedImage),
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          // Horizontal scrollable row of thumbnails
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              children: [
                ImageWidget(
                  image: 'lib/assets/image1.jpeg',
                  isSelected: selectedImage == 'lib/assets/image1.jpeg',
                  onTap: () => setState(() => selectedImage = 'lib/assets/image1.jpeg'),
                ),
                ImageWidget(
                  image: 'lib/assets/image3.jpeg',
                  isSelected: selectedImage == 'lib/assets/image3.jpeg',
                  onTap: () => setState(() => selectedImage = 'lib/assets/image3.jpeg'),
                ),
                ImageWidget(
                  image: 'lib/assets/image2.jpeg',
                  isSelected: selectedImage == 'lib/assets/image2.jpeg',
                  onTap: () => setState(() => selectedImage = 'lib/assets/image2.jpeg'),
                ),
                ImageWidget(
                  image: 'lib/assets/image4.jpeg',
                  isSelected: selectedImage == 'lib/assets/image4.jpeg',
                  onTap: () => setState(() => selectedImage = 'lib/assets/image4.jpeg'),
                ),
                ImageWidget(
                  image: 'lib/assets/image5.jpeg',
                  isSelected: selectedImage == 'lib/assets/image5.jpeg',
                  onTap: () => setState(() => selectedImage = 'lib/assets/image5.jpeg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.image,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black,
            width: isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image(
          image: AssetImage(image),
          height: 150,
          width: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
