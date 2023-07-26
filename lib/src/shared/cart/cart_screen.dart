import 'package:flutter/material.dart';
import 'package:greengrocer/src/shared/services/utils_services.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/custom_elevated_button_widget.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Placeholder(
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Total Geral',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    UtilsServices().priceToCurrency(48.50),
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColors.customSwatchColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomElevatedButtonWidget(
                    height: 50,
                    width: double.infinity,
                    backgroundColor: AppColors.customSwatchColor,
                    title: 'Concluir Pedido',
                    hasIcon: true,
                    onPressed: () {},
                    iconData: Icons.shopping_cart_checkout_rounded,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
