import 'package:intl/intl.dart';

class Utils {
  static toRupiah(int price) {
    var formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 2,
    );

    return formatter.format(price);
  }
}
