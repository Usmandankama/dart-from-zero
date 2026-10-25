// Lesson 12 · Tests
//
// Run them from the shop folder:   dart test

import 'package:shop/money.dart';
import 'package:test/test.dart';

void main() {
  // group puts related tests together. Each test checks one thing.
  group('formatNaira', () {
    test('small amounts have no comma', () {
      // expect(what you got, what it should be). If they differ, the test
      // fails and tells you both values.
      expect(formatNaira(0), '₦0');
      expect(formatNaira(999), '₦999');
    });

    test('puts a comma before every three digits', () {
      expect(formatNaira(1000), '₦1,000');
      expect(formatNaira(28800), '₦28,800');
      expect(formatNaira(1234567), '₦1,234,567');
    });

    test('puts the minus sign before the naira sign', () {
      expect(formatNaira(-2500), '-₦2,500');
    });
  });

  group('formatDollars', () {
    test('converts at the rate and rounds to cents', () {
      expect(formatDollars(1200, 0.00065), r'$0.78');
      expect(formatDollars(100000, 0.00065), r'$65.00');
    });
  });
}
