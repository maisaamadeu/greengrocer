import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/shared/services/utils_services.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.item});

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //IMAGE
                Expanded(
                  child: Hero(
                    tag: widget.item.imgUrl,
                    child: Image.asset(widget.item.imgUrl),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //NAME AND QUANTITY
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.item.itemName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                            QuantityWidget(
                              item: widget.item,
                              onPress: (bool add) {
                                add ? quantity++ : quantity--;
                              },
                            ),
                          ],
                        ),

                        //PRICE
                        Text(
                          UtilsServices().priceToCurrency(widget.item.price),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: AppColors.customSwatchColor,
                          ),
                        ),

                        //SPACE
                        const SizedBox(
                          height: 10,
                        ),

                        //DESCRIPTION
                        SingleChildScrollView(
                          child: Text(
                            widget.item.description,
                            style: const TextStyle(
                              height: 1.5,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        //SPACE
                        Expanded(
                          child: Container(),
                        ),

                        //ADD TO CAR
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(5),
                              shadowColor: MaterialStateProperty.all(
                                  Colors.grey.shade500),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              shape: MaterialStateProperty.all<OutlinedBorder?>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Adicionar ao Carrinho',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
