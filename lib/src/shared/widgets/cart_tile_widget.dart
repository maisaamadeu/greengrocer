import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/shared/services/utils_services.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/quantity_widget.dart';

class CartTileWidget extends StatefulWidget {
  CartTileWidget({
    super.key,
    required this.cartItem,
    required this.remove,
    required this.updateState,
  });

  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  final VoidCallback updateState;

  @override
  State<CartTileWidget> createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
  late int quantity;

  @override
  Widget build(BuildContext context) {
    quantity = widget.cartItem.quantity;
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //IMAGE
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        //TITLE
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        //TOTAL
        subtitle: Text(
          UtilsServices().priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: AppColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        //QUANTITY
        trailing: QuantityWidget(
          isRemovable: true,
          item: widget.cartItem.item,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });

            widget.updateState();
          },
        ),
      ),
    );
  }
}
