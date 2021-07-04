import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:matrixenergygrid/models/login_exception.dart';
import 'package:matrixenergygrid/models/user.dart';
import 'package:matrixenergygrid/services/cookie_service.dart';
import 'package:openapi/openapi.dart';

class AuthenticationStore extends ChangeNotifier {
  final CookieService _cookieService;
  final DefaultApi _api;
  String? _cookie;

  User? get currentUser => _cookie == null ? null : User.fromCookie(_cookie!);

  bool get isAuthenticated => currentUser != null;

  AuthenticationStore(this._cookieService, this._api) {
    reloadCookie();
  }

  void reloadCookie() {
    _cookie = _cookieService.getAuthCookie();
    notifyListeners();
  }

  void logout() {
    _cookieService.clearCookie();
    reloadCookie();
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    try {
      await _api.login(
        username: username,
        password: password,
        extra: {"withCredentials": true},
      );
      reloadCookie();
      return isAuthenticated;
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        throw LoginException.fromDioException(dioError);
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> changeDisplayName(String newDisplayName) async {
    if (currentUser == null) throw ArgumentError();
    await _api.changeDisplayName(
        username: currentUser!.username,
        displayName: newDisplayName,
        extra: {
          "withCredentials": true,
        });
    reloadCookie();
    notifyListeners();
  }
}
