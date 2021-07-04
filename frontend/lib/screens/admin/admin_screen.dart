import 'package:flutter/material.dart';
import 'package:matrixenergygrid/middlewares/admin_middleware.dart';
import 'package:matrixenergygrid/screens/admin/access_restricted_message.dart';
import 'package:matrixenergygrid/screens/admin/ssh_key_upload_form.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminMiddleware(
      adminChild: SSHKeyUploadForm(),
      notAdminChild: AccessRestrictedMessage(),
    );
  }
}
