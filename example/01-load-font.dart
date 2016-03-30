import 'dart:html';
import 'dart:js';

import 'package:opentype/opentype.dart';

main() {

  /// Use [allowInterop]() to wrap the Dart functions passed as arguments.
  loadFont('packages/opentype/extern/fonts/Roboto-Black.ttf', allowInterop(fontLoaded));
}

void fontLoaded(String err, Font font) {

  if (err != null) {
    print("Font could not be loaded: $err");

  } else {
    CanvasElement canvas = querySelector("#canvas");
    CanvasRenderingContext2D ctx = canvas.getContext('2d');

    font.draw(ctx, 'ħ€Łłö ŴØ¶ĹÐ', 0, 80, 42);
  }
}
