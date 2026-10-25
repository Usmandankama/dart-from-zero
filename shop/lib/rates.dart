import 'dart:convert';

// http is a package from pub.dev, added with `dart pub add http`. as http
// means we write http.get, so it's clear where get comes from.
import 'package:http/http.dart' as http;

// Free exchange rates from ExchangeRate-API. No sign-up or key needed;
// the rates update once a day. Their terms ask us to credit them.
const ratesCredit =
    'Rates by Exchange Rate API: https://www.exchangerate-api.com';

class RatesService {
  static final _url = Uri.parse('https://open.er-api.com/v6/latest/NGN');

  // How many dollars one naira is worth, for example 0.00065.
  // Throws if there's no internet, the server is slow, or the reply is wrong.
  Future<double> nairaToDollar() async {
    // timeout stops waiting after 10 seconds and throws a TimeoutException.
    http.Response response = await http
        .get(_url)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      throw http.ClientException(
        'The rates server replied ${response.statusCode}',
        _url,
      );
    }

    // The reply looks like: {"result":"success", "rates":{"USD":0.00065, ...}}
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    var rates = data['rates'] as Map<String, dynamic>;
    var usd = rates['USD'];
    if (usd is! num) {
      throw FormatException('The reply had no USD rate', response.body);
    }
    return usd.toDouble();
  }
}
