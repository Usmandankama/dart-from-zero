import 'dart:convert';
import 'dart:io';

import 'shop.dart';

// Saves the shop to a JSON file and loads it back, so nothing is lost when
// the program closes.
class ShopStorage {
  final File file;

  ShopStorage(this.file);

  // Reading a file takes time, so it gives back a Future: a promise of a
  // Shop that arrives later. Inside an async function, await waits for a
  // Future to finish and hands you what's inside.
  Future<Shop> load() async {
    // The very first time, there's no file yet: start with the sample stock.
    if (!await file.exists()) {
      return Shop.withSampleStock();
    }

    String text = await file.readAsString();
    try {
      return Shop.fromJson(jsonDecode(text) as Map<String, dynamic>);
    } catch (error) {
      // The file is damaged, maybe edited by hand. Keep a copy instead of
      // throwing it away, and start again with the sample stock.
      File copy = await file.copy('${file.path}.damaged');
      print('Could not read ${file.path}, so it was copied to ${copy.path}.');
      print('Starting again with the sample stock.');
      return Shop.withSampleStock();
    }
  }

  // Future<void>: nothing comes back, but you can still await it to know
  // when the saving has finished.
  Future<void> save(Shop shop) async {
    // withIndent spreads the JSON over several lines, so a person can read it.
    String text = JsonEncoder.withIndent('  ').convert(shop.toJson());
    await file.writeAsString(text);
  }
}
