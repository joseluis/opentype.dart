@JS("opentype")
library opentype;

import "dart:typed_data";

import "package:js/js.dart";

import "font.dart";

typedef void FontLoadedCB<String, Font>(String err, Font font);

/// Loads a font from a URL.
///
/// You must wrap the callback function with `allowInterop()`.
/// You should check if the [err] is [null] before using the font.
///
///
/// Usage example:
/// ```
/// loadFont('fonts/Roboto-Black.ttf', allowInterop((err, font) {
///   if (err != null) {
///     print('Could not load the font: $err');
///   } else {
///     // Use your font here.
///   }
/// }));
/// ```
@JS('load')
external void loadFont(String url, FontLoadedCB callback);

/// Parses a buffer that contains a [Font] binary data.
///
/// This method always returns a [Font], but check [Font.supported] to see if
/// the font is in a supported format. (Fonts can be marked unsupported if
/// they have encoding tables we can't read).
///
/// Usage example:
/// ```
/// 
/// ```
@JS('parse')
external Font parseFont(ByteBuffer buffer);
