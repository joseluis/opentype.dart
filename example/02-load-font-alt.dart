import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

import 'package:opentype/opentype.dart';

void main() {
  HttpRequest.request('packages/opentype/extern/fonts/Roboto-Black.ttf', responseType: 'arraybuffer')
    .then((HttpRequest request) {

      Uint8List bytes = new Uint8List.view(request.response);
      Font font = parseFont(bytes.buffer);

      // Check if the font is supported after parsing a font.
      if (font.supported) fontLoaded(font);
  });
}

void fontLoaded(Font font) {
  CanvasElement canvas = querySelector("#canvas");
  CanvasRenderingContext2D ctx = canvas.getContext('2d');

  // Rotate the canvas from the center before drawing.
  ctx.translate(canvas.width / 2, canvas.height / 2);
  ctx.rotate(PI * 1.3);

  // Get the Path and draw it.
  Path path = font.getPath('ħ€Łłö ŴØ¶ĹÐ', -60, 20, 42);
  path.draw(ctx);
}
