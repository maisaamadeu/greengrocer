import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/shared/services/utils_services.dart';
import 'package:greengrocer/src/shared/widgets/custom_elevated_button_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialogWidget extends StatelessWidget {
  const PaymentDialogWidget({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //TITLE
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                //QR Code
                QrImageView(
                  data: order.id,
                  version: QrVersions.auto,
                  size: 200,
                ),

                //Vencimento
                Text(
                  'Vencimento: ${UtilsServices().formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                //TOTAL
                Text(
                  'Total: ${UtilsServices().priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //BUTTON COPY AND PASTE
                CustomElevatedButtonWidget(
                  height: 50,
                  backgroundColor: Colors.green,
                  title: 'Copiar código pix',
                  hasIcon: true,
                  onPressed: () {},
                  width: double.infinity,
                  iconData: Icons.copy,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
