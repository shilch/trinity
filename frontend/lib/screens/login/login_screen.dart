import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matrixenergygrid/widgets/matrix_underlay.dart';

import 'login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Matrix Energy Grid Inc."),
      ),
      body: MatrixUnderlay(
        child: LoginCard(),
      ),
    );
  }
}
