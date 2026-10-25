import 'package:shop/product.dart';
import 'package:shop/shop.dart';
import 'package:shop/shop_exception.dart';
import 'package:test/test.dart';

void main() {
  // late means "I'll set this before I use it". setUp runs before every
  // test, so each one starts with a fresh shop.
  late Shop shop;
  late Product spaghetti;

  setUp(() {
    shop = Shop.withSampleStock();
    spaghetti = shop.find('Golden Penny Spaghetti')!;
  });

  group('selling', () {
    test('takes the stock down and records the sale', () {
      var sale = shop.sell(spaghetti, 3);

      expect(spaghetti.stock, 21);
      expect(sale.total, 3600);
      expect(shop.sales.length, 1);
    });

    test('refuses to sell more than is in stock', () {
      // throwsA checks that the code inside the () {} throws.
      expect(() => shop.sell(spaghetti, 25), throwsA(isA<ShopException>()));
      // And the stock didn't change.
      expect(spaghetti.stock, 24);
    });

    test('refuses to sell a sold-out product', () {
      Product cola = shop.find('Coca-Cola (50cl)')!;
      expect(() => shop.sell(cola, 1), throwsA(isA<ShopException>()));
    });
  });

  group('adding products', () {
    test('a new product shows up in the shop', () {
      shop.add(
        Product(name: 'Zobo', category: Category.drinks, price: 200, stock: 12),
      );
      expect(shop.find('zobo')?.price, 200);
    });

    test('the same name twice is refused, whatever the capitals', () {
      Product copy = Product(
        name: 'peak milk (TIN)',
        category: Category.food,
        price: 700,
        stock: 1,
      );
      expect(() => shop.add(copy), throwsA(isA<ShopException>()));
    });
  });

  group("today's report", () {
    test('adds up the sales and finds the best seller', () {
      shop.sell(spaghetti, 2);
      shop.sell(shop.find('Indomie Chicken')!, 10);
      shop.sell(spaghetti, 1);

      var report = shop.todaysReport();
      expect(report.sales, 3);
      expect(report.itemsSold, 13);
      expect(report.takings, 2 * 1200 + 10 * 300 + 1200);
      expect(report.bestSeller, 'Indomie Chicken');
    });

    test("doesn't count other days' sales", () {
      shop.sell(spaghetti, 2);
      DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

      var report = shop.todaysReport(day: yesterday);
      expect(report.sales, 0);
      expect(report.bestSeller, isNull);
    });
  });

  test('saving and loading gives back the same shop', () {
    shop.sell(spaghetti, 4);
    shop.dollarRate = 0.00065;

    Shop loaded = Shop.fromJson(shop.toJson());

    expect(loaded.products.length, shop.products.length);
    expect(loaded.find('Golden Penny Spaghetti')!.stock, 20);
    expect(loaded.sales.single.total, 4800);
    expect(loaded.dollarRate, 0.00065);
  });
}
