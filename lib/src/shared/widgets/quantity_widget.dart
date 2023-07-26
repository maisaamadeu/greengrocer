import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/shared/widgets/quantity_button_widget.dart';

class QuantityWidget extends StatefulWidget {
  QuantityWidget({super.key, required this.item, required this.onPress});

  final ItemModel item;
  final Function(bool) onPress;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 0;

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
          QuantityButtonWidget(
              icon: Icons.remove_rounded,
              color: Colors.grey,
              onTap: () {
                setState(() {
                  quantity--;
                });
              }),
          Text(
            '$quantity ${unit[0].toUpperCase()}${unit.replaceAll(unit[0], '')}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          QuantityButtonWidget(
            icon: Icons.add_rounded,
            color: Colors.green,
            onTap: () {
              setState(() {
                quantity++;
              });
            },
          ),
        ],
      ),
    );
  }
}
