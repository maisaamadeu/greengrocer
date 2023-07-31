import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/shared/services/utils_services.dart';
import 'package:greengrocer/src/shared/widgets/order_status_widget.dart';
import 'package:greengrocer/src/shared/widgets/payment_dialog_widget.dart';

class OrderTileWidget extends StatelessWidget {
  const OrderTileWidget({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pedido: ${order.id}",
                style: const TextStyle(color: Colors.green),
              ),
              Text(
                UtilsServices().formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //PRODUCTS LIST
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: SizedBox(
                        child: ListView(
                          children: order.items.map((item) {
                            return _OrderItemWidget(
                              item: item,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  //DIVIDER
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 25,
                  ),

                  //ORDER STATUS
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //TOTAL
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: UtilsServices().priceToCurrency(
                      order.total,
                    ),
                  ),
                ],
              ),
            ),

            //PAGAMENT BUTTON
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(5),
                  shadowColor: MaterialStateProperty.all(Colors.grey.shade500),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<OutlinedBorder?>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => PaymentDialogWidget(order: order),
                  );
                },
                icon: Image.asset(
                  'assets/images/app_images/pix.png',
                  height: 18,
                ),
                label: const Text(
                  'Ver QR Code Pix',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${item.quantity} ${item.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(item.item.itemName),
          ),
          Text(
            UtilsServices().priceToCurrency(
              item.item.price,
            ),
          ),
        ],
      ),
    );
  }
}
