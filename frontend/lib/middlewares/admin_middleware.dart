import 'package:flutter/widgets.dart';
import 'package:matrixenergygrid/stores/authentication_store.dart';
import 'package:provider/provider.dart';

class AdminMiddleware extends StatelessWidget {
  final Widget adminChild;
  final Widget notAdminChild;

  const AdminMiddleware({
    Key? key,
    required this.adminChild,
    required this.notAdminChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<AuthenticationStore>(context).currentUser?.isAdmin ==
            true
        ? adminChild
        : notAdminChild;
  }
}
