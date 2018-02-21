@JS()
library medium_editor;

import 'dart:async';
import 'dart:html';

import 'package:dart_browser_loader/dart_browser_loader.dart';
import 'package:js/js.dart';

Future<Null> loadMediumEditorSource() async {
  //  TODO: fix load medium script from dart
//  await loadScript(
//      "https://cdn.jsdelivr.net/npm/medium-editor@5.23.2/dist/js/medium-editor.min.js",
//      id: "jssdk-mediumeditor");
  await loadLink(
      "https://cdn.jsdelivr.net/npm/medium-editor@5.23.2/dist/css/medium-editor.min.css",
      id: 'medium-editor-css');
  await loadLink(
      "https://cdn.jsdelivr.net/npm/medium-editor@5.23.3/dist/css/themes/default.min.css",
      id: 'medium-editor-theme');
}

@JS('MediumEditor')
class MediumEditorInterop {
  external factory MediumEditorInterop(value, MediumEditorOptions options);

  external void setContent(html, index);

  external String getContent(index);
}

@JS()
@anonymous
class PlaceHolderOptions {
  /// Defines the default placeholder for empty contenteditables when placeholder is not set to false.
  /// You can overwrite it by setting a data-placeholder attribute on the editor elements.
  external String get text;

  /// Causes the placeholder to disappear as soon as the field gains focus.
  /// To hide the placeholder only after starting to type, and to show it again as soon as field is empty, set this option to false.
  external bool get hideOnClick;

  external factory PlaceHolderOptions({String text, bool hideOnClick});
}

@JS()
@anonymous
class MediumEditorOptions {
  /// The placeholder handler is a built-in extension which displays placeholder text when the editor is empty.
  external PlaceHolderOptions get placeholder;

  external factory MediumEditorOptions({PlaceHolderOptions placeholder});
}

class MediumEditor {
  MediumEditorInterop _me;

  MediumEditor(Element element, {MediumEditorOptions options})
      : _me = new MediumEditorInterop(element, options);

  /// Sets the html content for the first editor element, or the element at index.
  /// Ensures the the editableInput event is triggered.
  void setContent(html, {int index}) => _me.setContent(html, index);

  /// Returns the trimmed html content for the first editor element, or the element at index.
  String getContent({int index}) => _me.getContent(index);
}
