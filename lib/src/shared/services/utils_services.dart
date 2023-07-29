import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_br');
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    String dateFormat = DateFormat('dd/MM/yyyy - HH:mm').format(dateTime);
    return dateFormat;
  }
}
