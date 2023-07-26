import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/quantity_button_widget.dart';

class QuantityWidget extends StatelessWidget {
  QuantityWidget(
      {super.key,
      required this.item,
      required this.result,
      required this.value,
      required this.isRemovable});

  final ItemModel item;
  final Function(int) result;
  final int value;
  final bool isRemovable;

  @override
  Widget build(BuildContext context) {
    final unit = item.unit;
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
              icon: !isRemovable || value > 1
                  ? Icons.remove_rounded
                  : Icons.delete_forever_rounded,
              color: !isRemovable || value > 1
                  ? Colors.grey
                  : AppColors.customContrastColor,
              onTap: () {
                if (value == 1 && !isRemovable) return;

                int resultCount = value - 1;
                result(resultCount);
              }),
          Text(
            '$value ${unit[0].toUpperCase()}${unit.replaceAll(unit[0], '')}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          QuantityButtonWidget(
            icon: Icons.add_rounded,
            color: Colors.green,
            onTap: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}
