@JS("opentype")
library opentype.path;

import "dart:html";

import "package:js/js.dart";

/// Once you have a path through [Font.getPath] or [Glyph.getPath], you can use it.
@JS()
class Path {
  external Path();

  /// The path commands.
  ///
  /// Each command is a dictionary containing a type and coordinates.
  ///
  /// Examples:
  /// - Move To:  `{type: 'M', x: 100, y: 200}`
  /// - Line To:  `{type: 'L', x: 100, y: 200}`
  /// - Curve To: `{type: 'C', x1: 0, y1: 50, x2: 100, y2: 200, x: 100, y: 200}`
  /// - Quad To:  `{type: 'Q', x1: 0, y1: 50, x: 100, y: 200}`
  /// - Close:    `{type: 'Z'}`
  external List<PathCommand> get commands;
  external set commands(List<PathCommand> commands);

  /// The fill color of the [Path].
  ///
  /// Color is a string representing a CSS color. Default is 'black'.
  external String get fill;
  external set fill(String fill);

  /// The stroke color of the [Path].
  ///
  /// Color is a string representing a CSS color.
  /// Default is [null], which means the path will not be stroked.
  external String get stroke;
  external set stroke(String stroke);

  /// The line thickness of the Path.
  ///
  /// Default is 1, but if the [stroke] is null no stroke will be drawn.
  external num get strokeWidth;
  external set strokeWidth(num strokeWidth);

  /// Moves to a new position, which creates a new contour.
  external void moveTo(num x, num y);

  /// Draws a line from the previous position to the given coordinate.
  external void lineTo(num x, num y);

  /// Draws a bézier curve from the current position to the given coordinate.
  external void curveTo(num x1, num y1, num x2, num y2, num x, num y);

  /// Draws a quadratic bézier curve from the current position to the given coordinate.
  external void quadTo(num x1, num y1, num x, num y);

  /// Closes the path.
  ///
  /// If stroked, this will draw a line from the first to the last point of the contour.
  external void close();

  /// Draw the path on the given 2D context.
  ///
  /// This uses the fill, stroke and strokeWidth properties of the Path object.
  /// [ctx]: The drawing context.
  external void draw(CanvasRenderingContext2D ctx);

  /// Convert the Path to a string of path data instructions. See http://www.w3.org/TR/SVG/paths.html#PathData
  ///
  /// [decimalPlaces]: The amount of decimal places for floating-point values. (default: 2)
  external String toPathData(num decimalPlaces);

  /// Convert the path to a SVG <path> element, as a string.
  ///
  /// [decimalPlaces]: The amount of decimal places for floating-point values. (default: 2)
  external String toSVG(num decimalPlaces);
}

@anonymous
@JS()
class PathCommand {
  external factory PathCommand({
    String type,
    num x,
    num y,
    num x1,
    num y1,
    num x2,
    num y2
  });

  external String get type;
  external set type(String type);

  external num get x;
  external set x(num x);
  external num get y;
  external set y(num y);

  external num get x1;
  external set x1(num x1);
  external num get y1;
  external set y1(num y1);

  external num get x2;
  external set x2(num x2);
  external num get y2;
  external set y2(num y2);
}
