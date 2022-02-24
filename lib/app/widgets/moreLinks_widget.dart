import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class MoreLinks extends StatefulWidget {
  final String urlPage;

  const MoreLinks({Key? key, required this.urlPage}) : super(key: key);

  @override
  State<MoreLinks> createState() => _MoreLinksState();
}

class _MoreLinksState extends State<MoreLinks> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: deviceWidth * 0.7,
      height: deviceHeight * 0.6,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.urlPage,
      ),
    );
  }
}
