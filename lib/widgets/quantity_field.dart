import 'package:flutter/material.dart';

class StockQuantityWidget extends StatefulWidget {
  const StockQuantityWidget({super.key, required this.minOrder});

  final int minOrder;

  @override
  State<StockQuantityWidget> createState() => _StockQuantityWidgetState();
}

class _StockQuantityWidgetState extends State<StockQuantityWidget> {
  int _selectedQuantity = 1;

  void _increaseQuantity() {
    if (_selectedQuantity >= 1) {
      setState(() {
        _selectedQuantity++;
      });
    }
  }

  void _decreaseQuantity() {
    if (_selectedQuantity > 0) {
      setState(() {
        _selectedQuantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                if (_selectedQuantity > widget.minOrder) {
                  _decreaseQuantity();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Maximum stock reached')),
                  );
                }
              },
              icon: const Icon(Icons.remove, color: Colors.white)),
          Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('$_selectedQuantity', style: const TextStyle(fontSize: 24, color: Colors.white))),
          ),
          IconButton(
            onPressed: () => _increaseQuantity(),
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
