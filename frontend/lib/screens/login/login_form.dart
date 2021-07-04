import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:matrixenergygrid/models/login_exception.dart';
import 'package:matrixenergygrid/stores/authentication_store.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            name: "username",
            decoration: InputDecoration(labelText: 'Username'),
            validator: FormBuilderValidators.required(context),
          ),
          FormBuilderTextField(
            name: "password",
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: FormBuilderValidators.required(context),
          ),
          SizedBox(height: 16),
          ElevatedButton(onPressed: _verify, child: Text("Sign in"))
        ],
      ),
    );
  }

  _verify() async {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() == true) {
      final Map<String, dynamic> values = _formKey.currentState?.value ?? {};
      String? content;
      var result = false;
      try {
        result = await Provider.of<AuthenticationStore>(context, listen: false)
            .login(
          values['username'],
          values['password'],
        );
      } on LoginException catch (e) {
        result = false;
        content = e.errorMessage.message;
      }
      if (!result) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Login failed"),
                  content: content != null ? Text(content) : null,
                  actions: [
                    OutlinedButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text('Close'))
                  ],
                ));
      }
    }
  }
}
