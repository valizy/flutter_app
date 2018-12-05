import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: WebViewExample()));

class SampleMenu extends StatelessWidget {
  const SampleMenu();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('You selected: $value'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            const PopupMenuItem<String>(
              value: 'Item 1',
              child: Text('Item 1'),
            ),
            const PopupMenuItem<String>(
              value: 'Item 2',
              child: Text('Item 2'),
            ),
          ],
    );
  }
}

class WebViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[const SampleMenu()],
      ),
      body: const WebView(
        initialUrl: 'https://flutter.io',
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}
