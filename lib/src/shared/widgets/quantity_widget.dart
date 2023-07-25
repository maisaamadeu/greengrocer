import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';

class QuantityWidget extends StatefulWidget {
  QuantityWidget({super.key, required this.item});

  final ItemModel item;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final unit = widget.item.unit;
    return Container(
      width: 130,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          700,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(245),
            onTap: () {
              if (quantity > 0) {
                setState(() {
                  quantity--;
                });
              }
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.remove_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Text(
            '$quantity ${unit[0].toUpperCase()}${unit.replaceAll(unit[0], '')}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(245),
            onTap: () {
              setState(() {
                quantity++;
              });
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
