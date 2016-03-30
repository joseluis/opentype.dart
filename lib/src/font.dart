@JS("opentype")
library opentype.font;

import 'dart:html' show CanvasRenderingContext2D;
import 'dart:typed_data' show ByteBuffer;

import "package:js/js.dart";

import 'glyph.dart';
import 'path.dart';

/// A Font represents a loaded OpenType font file.
///
/// It contains a set of glyphs and methods to draw text on
/// a drawing context, or to get a path representing the text.
@JS()
class Font {
  external Font([FontOptions options]);

  /// Retrieve the value of the kerning pair.
  ///
  /// Between the left glyph (or its index) and the right glyph (or its index).
  /// If no kerning pair is found, return 0. The kerning value gets added to
  /// the advance width when calculating the spacing between glyphs.
  external getKerningValue(dynamic leftGlyph, dynamic rightGlyph);

  /// Convert the character to a Glyph object.
  ///
  /// Returns null if the glyph could not be found.ç
  /// Note that this function assumes that there is a one-to-one mapping between
  /// the given character and a glyph; for complex scripts this might not be the case.
  external Glyph charToGlyphs(num char);

  // In the browser, you can use Font.download() to instruct the browser
  // to download a binary .OTF file. The name is based on the font name.
  external void download();

  /// Create a Path that represents the given text.
  /// 
  /// [ctx]: A 2D drawing context, like Canvas.
  /// [x]: Horizontal position of the beginning of the text. (default: 0)
  /// [y]: Vertical position of the baseline of the text. (default: 0)
  /// [fontSize]: Size of the text in pixels. (default: 72)
  ///
  /// Options is an optional object containing:
  ///
  /// [kerning]: if true takes kerning information into account. (default: true)
  external void draw(CanvasRenderingContext2D ctx, String text, num x, num y, num fontSize, [KerningOptions options]);

  /// Draw lines indicating important font measurements for all glyphs in the text.
  ///
  /// Black lines indicate the origin of the coordinate system (point 0,0).
  /// Blue lines indicate the glyph bounding box.
  /// Green line indicates the advance width of the glyph.
  external void drawMetrics(CanvasRenderingContext2D ctx, String text, num x, num y, num fontSize, [KerningOptions options]);

  /// Draw the points of all glyphs in the text.
  ///
  /// On-curve points will be drawn in blue, off-curve points will be drawn in red.
  external void drawPoints(CanvasRenderingContext2D ctx, String text, num x, num y, num fontSize, [KerningOptions options]);

  /// Create a [Path] that represents the given [text].
  ///
  /// [x]: Horizontal position of the beginning of the text. (default: 0)
  /// [y]: Vertical position of the baseline of the text. (default: 0)
  /// [fontSize]: Size of the text in pixels (default: 72).
  ///
  /// Options is an optional object containing:
  /// [kerning]: if true takes kerning information into account (default: true)
  external Path getPath(String text, num x, num y, num fontSize, [KerningOptions options]);

  /// Create a list of [Path]s that represents the given [text].
  ///
  /// [x]: Horizontal position of the beginning of the text. (default: 0)
  /// [y]: Vertical position of the baseline of the text. (default: 0)
  /// [fontSize]: Size of the text in pixels (default: 72).
  ///
  /// Options is an optional object containing:
  /// [kerning]: if true takes kerning information into account (default: true)
  external List<Path> getPaths(String text, num x, num y, num fontSize, [KerningOptions options]);

  /// Convert the string to a list of glyph objects. Note that there is no strict 1-to-1 correspondence between the string and glyph list due to possible substitutions such as ligatures. The list of returned glyphs can be larger or smaller than the length of the given string.
  external List<Glyph> stringToGlyphs(String string);

  /// [parseFont] will throw an error if font is not supported.
  external bool get supported;

  /// Converts the font object to a SFNT data structure.
  ///
  /// This structure contains all the necessary tables and metadata to create a binary OTF file.
  external Object toTables();

  /// Generates a [ByteBuffer] with the font SFNT data structure.
  external ByteBuffer toArrayBuffer();
}

@anonymous
@JS()
class FontOptions {
  external factory FontOptions({
    String familyName,
    String styleName,
    num unitsPerEm,
    num ascender,
    num descender,
    List<Glyph> glyphs
  });

  /// 
  external String get familyName;
  external set familyName(String familyName);

  /// 
  external String get styleName;
  external set styleName(String styleName);

  /// This value determines the size of the grid.
  ///
  /// X/Y coordinates in fonts are stored as integers,
  /// common values are 2048 and 4096.
  external num get unitsPerEm;
  external set unitsPerEm(num unitsPerEm);

  /// Distance from baseline of highest ascender.
  ///
  /// In font units, not pixels.
  external num get ascender;
  external set ascender(num ascender);

  /// Distance from baseline of lowest descender.
  ///
  /// In font units, not pixels.
  external num get descender;
  external set descender(num descender);

  /// An indexed list of [Glyph] objects.
  external List<Glyph> get glyphs;
  external set glyphs (List<Glyph> glyphs);
}

@anonymous
@JS()
class KerningOptions {
  external factory KerningOptions({
    // if true takes kerning information into account.
    bool kerning
  });
  external String get kerning;
  external set kerning(String kerning);
}
