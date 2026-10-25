# Dart from Zero: course code

This is the code for **Dart from Zero** on [PadiLearn](https://padilearn.com). In 12 lessons you learn Dart from scratch and build `shop`, a command-line stock and sales tool for a small provision shop. It keeps track of products and stock, records sales, warns you when something is running low, prints the day's sales report, saves everything to a file, shows prices in dollars using today's exchange rate, and builds into a `.exe` you can give to a shop owner.

## Get the code for any lesson

Every coding lesson has a tag that holds the code exactly as it is **at the end of that lesson**:

| Lesson | Tag |
|---|---|
| 02 · Install Dart and run your first program | `lesson-02` |
| 03 · Variables, types and text | `lesson-03` |
| 04 · Null safety: values that might be missing | `lesson-04` |
| 05 · Making decisions and repeating: if, switch and loops | `lesson-05` |
| 06 · Functions | `lesson-06` |
| 07 · Lists, maps and sets | `lesson-07` |
| 08 · Classes, enums and records | `lesson-08` |
| 09 · When things go wrong: exceptions and input checks | `lesson-09` |
| 10 · Async and files: saving the shop to disk | `lesson-10` |
| 11 · Packages and the internet: live exchange rates | `lesson-11` |
| 12 · Tests, a real .exe, and what to learn next | `lesson-12` |

Lesson 01 has no code of its own.

**Without git (easiest):**
1. On this repo's GitHub page, click **Tags**.
2. Find the tag for the lesson you're on, for example `lesson-07`.
3. Click **zip** to download it, then unzip it.

**With git:**
```
git clone https://github.com/Usmandankama/dart-from-zero.git
cd dart-from-zero
git checkout lesson-07
```

Use the tag to compare against your own code when you're stuck. Type the code yourself as you follow the lesson; that's how you learn it.

## Run the app

```
cd shop
dart pub get
dart run
```

You need the Dart SDK installed first. Lesson 2 shows you how.

## Run the tests (lesson 12)

```
cd shop
dart test
```

## Build a .exe to share (lesson 12)

```
cd shop
dart compile exe bin/shop.dart -o shop.exe
```

`shop.exe` runs on any 64-bit Windows computer, even one without Dart. Put it in its own folder: the app saves its data in a file called `shop.json` next to wherever it's run from.

## Folders

- `shop/bin/shop.dart`: where the program starts. It shows the menu and asks the questions.
- `shop/lib/`: the shop itself, from lesson 8 onwards: products, sales, money formatting, saving and exchange rates.
- `shop/test/`: the tests, from lesson 12.
