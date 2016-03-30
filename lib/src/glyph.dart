@JS("opentype")
library opentype.glyph;

import "package:js/js.dart";

import "font.dart";
import "path.dart";

/// Glyphs are the basic building blocks of a font.
///
/// A Glyph is an individual mark that often corresponds to a character.
/// Some glyphs, such as ligatures, are a combination of many characters.
@JS()
class Glyph {
  external Glyph([GlyphOptions options]);

  /// The bounding box of the glyph.
  external num get xMin;
  external set xMin(num xMin);
  external num get yMin;
  external set yMin(num yMin);
  external num get xMax;
  external set xMax(num xMax);
  external num get yMax;
  external set yMax(num yMax);

  /// The raw, unscaled path of the glyph.
  external Path get path;
  external set path(Path path);

  /// Get a scaled glyph Path object we can draw on a drawing context.
  ///
  /// [x]: Horizontal position of the glyph. (default: 0)
  /// [y]: Vertical position of the baseline of the glyph. (default: 0)
  /// [fontSize]: Font size in pixels. (default: 72)
  external getPath(num x, num y, num fontSize);

  /// Draw the glyph on the given context.
  ///
  /// [ctx]: The drawing context.
  /// [x]: Horizontal position of the glyph. (default: 0)
  /// [y]: Vertical position of the baseline of the glyph. (default: 0)
  /// [fontSize]: Font size, in pixels (default: 72).
  external draw(ctx, num x, num y, num fontSize);

  /// Draw the points of the glyph on the given context.
  ///
  /// On-curve points will be drawn in blue, off-curve points will be drawn in red.
  ///
  /// [ctx]: The drawing context.
  /// [x]: Horizontal position of the glyph. (default: 0)
  /// [y]: Vertical position of the baseline of the glyph. (default: 0)
  /// [fontSize]: Font size, in pixels (default: 72).
  external drawPoints(ctx, num x, num y, num fontSize);

  /// Draw lines indicating important font measurements for all glyphs in the text.
  ///
  /// Black lines indicate the origin of the coordinate system (point 0,0).
  /// Blue lines indicate the glyph bounding box.
  /// Green line indicates the advance width of the glyph.
  ///
  /// [ctx]: The drawing context.
  /// [x]: Horizontal position of the glyph. (default: 0)
  /// [y]: Vertical position of the baseline of the glyph. (default: 0)
  /// [fontSize]: Font size, in pixels (default: 72).
  external drawMetrics(ctx, num x, num y, num fontSize);
}


@anonymous
@JS()
class GlyphOptions {
  external factory GlyphOptions({
    Font font,
    String name,
    num unicode,
    List<num> unicodes,
    num index,
    num advanceWidth,
    num xMin,
    num yMin,
    num xMax,
    num yMax,
    Path path
  }); 

  /// A reference to the Font object.
  external Font get font;
  external set font(Font font);

  /// The glyph name (e.g. "Aring", "five").
  external String get name;
  external set name(String name);

  /// The primary unicode value of this glyph.
  external num get unicode;
  external set unicode(num unicode);

  /// The list of unicode values for this glyph.
  ///
  /// Most of the time this will be 1, can also be empty.
  external List<num> get unicodes;
  external set unicodes(List<num> unicodes);

  /// The index number of the glyph.
  external num get index;
  external set index(num index);

  /// The width to advance the pen when drawing this glyph.
  external num get advanceWidth;
  external set advanceWidth(num advanceWidth);

}
