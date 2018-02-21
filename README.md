Wrap of [MediumEditor](https://github.com/yabwe/medium-editor)

##Basic usage

```html
<div class="editable"></div>
```

```dart
final mediumEditor = new MediumEditor(element.querySelector('.editable'),
    options: new MediumEditorOptions(
        placeholder:
            new PlaceHolderOptions(text: 'Your note', hideOnClick: true)));
```

To set the content of the editor use setContent like that
```dart
mediumEditor.setContent("Edit me!");
```

And to get the content of the editor use getContent
```dart
final content = mediumEditor.getContent();
```