/// Holds a dummy reference to the document
final document = Document();

/// Holds a dummy reference to the script element
class HtmlElement {
  String type = '';
  String innerHtml = '';
   String id= '';
  List<HtmlElement> children = [];
  void append(HtmlElement script) {}
  void remove() {}
}

/// Dummy class for the document
class Document {
  final HtmlElement? body = HtmlElement();
  HtmlElement? getElementById(String id) {
    if (body != null && body!.id == id) {
      return body;
    }
    for (var child in body!.children) {
      if (child.id == id) {
        return child;
      }
    }
    return null;
  }
}

/// Dummy class for the script element
class ScriptElement extends HtmlElement {

  @override
  void remove() {
    print('Script element removed');
  }
}
