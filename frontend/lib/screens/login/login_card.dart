import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTitle(context),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
