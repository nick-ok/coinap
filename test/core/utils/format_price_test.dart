import 'package:coincap/core/utils/format_price.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('format_price tests', () {
    test('Should return USD price with right format', () {
      expect(formatPrice(price: '10000'), '\$10,000.00');
    });

    test('Should return USD formatted and rounded price', () {
      expect(formatPrice(price: '1.0090'), '\$1.01');
    });

    test('Should return empty string when price is null', () {
      expect(formatPrice(), '');
    });
  });
}
