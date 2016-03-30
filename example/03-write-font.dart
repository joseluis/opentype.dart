import 'package:opentype/opentype.dart';

main() {

  // Create the bézier paths for each of the glyphs.
  // Note that the .notdef glyph is required.
  Glyph notdefGlyph = new Glyph(new GlyphOptions(
    name: '.notdef',
    unicode: 0,
    advanceWidth: 650,
    path: new Path()
  ));

  Path aPath = new Path();
  aPath.moveTo(100, 0);
  aPath.lineTo(100, 700);
  // more drawing instructions...

  Glyph aGlyph = new Glyph(new GlyphOptions(
    name: 'A',
    unicode: 65,
    advanceWidth: 650,
    path: aPath
  ));

  List<Glyph> glyphs = [notdefGlyph, aGlyph];

  Font font = new Font(new FontOptions(
    familyName: 'OpenTypeSans',
    styleName: 'Medium',
    unitsPerEm: 1000,
    ascender: 800,
    descender: -200,
    glyphs: glyphs
  ));

  font.download();
}

// TODO If you want to inspect the font, use font.toTables() to generate
// an object showing the data structures that map directly to binary values.
// If you want to get an ArrayBuffer, use font.toArrayBuffer().
