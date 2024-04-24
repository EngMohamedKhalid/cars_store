import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../app/widgets/default_app_bar_widget.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.url});
  final String url;
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  InAppWebViewController? webView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const DefaultAppBarWidget(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        initialSettings: InAppWebViewSettings(),
        onWebViewCreated: (controller) {
          setState(() {
            webView = controller;
          });
        },
      ),

    );
  }
}