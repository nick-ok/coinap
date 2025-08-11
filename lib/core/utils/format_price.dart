import 'package:intl/intl.dart';

String formatPrice({String locale = 'en_US', String? price}) {
  if (price == null) {
    return '';
  }

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: locale,
    name: '',
  );
  final double priceValue = double.tryParse(price) ?? 0;

  return '\$${currencyFormat.format(priceValue)}';
}
