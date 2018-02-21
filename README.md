Wrap of [MediumEditor](https://github.com/yabwe/medium-editor)

## Basic usage

```html
<head>
    ...
    <script src="//cdn.jsdelivr.net/npm/medium-editor@latest/dist/js/medium-editor.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/medium-editor@latest/dist/css/medium-editor.min.css" type="text/css" media="screen" charset="utf-8">
    ...
</head>

<body>
    ...
    <div class="editable"></div>
    ...
</body>
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