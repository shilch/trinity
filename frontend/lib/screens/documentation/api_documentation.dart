// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:matrixenergygrid/api.dart';
import 'package:matrixenergygrid/widgets/web_view.dart';

final docsUrl = '$baseURL/docs/';

class APIDocumentation extends StatelessWidget {
  const APIDocumentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: WebView(url: docsUrl)),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton(
            child: Text("Open in a new Tab"),
            onPressed: () {
              window.open(docsUrl, 'docs');
            },
          ),
        ))
      ],
    );
  }
}
