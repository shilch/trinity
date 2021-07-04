// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  final IFrameElement _iFrameElement = IFrameElement();

  WebView({Key? key, required url}) : super(key: key) {
    _iFrameElement.height = '500';
    _iFrameElement.width = '500';
    _iFrameElement.src = url;
    _iFrameElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: 'iframeElement',
      key: UniqueKey(),
    );
  }
}
