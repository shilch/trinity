import 'package:flutter/widgets.dart';
import 'package:matrixenergygrid/api.dart';
import 'package:matrixenergygrid/services/cookie_service.dart';
import 'package:matrixenergygrid/stores/authentication_store.dart';
import 'package:provider/provider.dart';

class AuthenticationMiddleware extends StatelessWidget {
  final Widget authenticatedChild;
  final Widget unauthenticatedChild;

  const AuthenticationMiddleware({
    Key? key,
    required this.authenticatedChild,
    required this.unauthenticatedChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AuthenticationStore(
            const CookieService(), openApi.getDefaultApi());
      },
      child: Builder(
        builder: (context) =>
            Provider.of<AuthenticationStore>(context).isAuthenticated
                ? authenticatedChild
                : unauthenticatedChild,
      ),
    );
  }
}
