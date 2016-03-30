A Dart API wrapper for [opentype.js](https://github.com/nodebox/opentype.js), an OpenType and TrueType font parser and writer.

[![Pub](https://img.shields.io/pub/v/opentype)](https://pub.dartlang.org/packages/opentype)

## Example Usage

```dart
main() {
  loadFont("MyFont.woff", allowInterop(fontLoaded));
}

fontLoaded(err, font) {
  if (err != null) {
    print("Couldn't load the font");
  } else {
    var canvas = querySelector("#canvas");
    var ctx = canvas.getContext('2d');
	font.draw(ctx, 'Hello World', 0, 25, 25);
  }
}
```
