// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CookieService {
  const CookieService();

  String? getAuthCookie() {
    return _getCookie("MATRIXSESSION");
  }

  Future<void> clearCookie() async {
    html.document.cookie = 'MATRIXSESSION=; Max-Age=0';
  }

  String? _getCookie(String key) {
    String cookies = html.document.cookie ?? "";
    List<String> listValues =
        cookies.isNotEmpty ? cookies.split(";") : const [];
    String? matchVal;
    for (int i = 0; i < listValues.length; i++) {
      List<String> map = listValues[i].split("=");
      String _key = map[0].trim();
      String _val = map.sublist(1).join("=").trim();
      if (key == _key) {
        matchVal = _val;
        break;
      }
    }
    return matchVal;
  }
}
