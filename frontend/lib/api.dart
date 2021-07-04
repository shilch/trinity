import 'dart:html';

import 'package:dio/adapter_browser.dart';
import 'package:openapi/openapi.dart';

final _adapter = BrowserHttpClientAdapter()..withCredentials = true;
final origin = window.location.origin;
final baseURL = "$origin/api/v1";
final openApi = Openapi(basePathOverride: baseURL)
  ..dio.httpClientAdapter = _adapter;
