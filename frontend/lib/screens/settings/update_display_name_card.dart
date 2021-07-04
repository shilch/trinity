import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:matrixenergygrid/models/user.dart';
import 'package:matrixenergygrid/stores/authentication_store.dart';
import 'package:matrixenergygrid/widgets/title_card.dart';
import 'package:provider/provider.dart';

class UpdateDisplayNameCard extends StatefulWidget {
  @override
  _UpdateDisplayNameCardState createState() => _UpdateDisplayNameCardState();
}

class _UpdateDisplayNameCardState extends State<UpdateDisplayNameCard> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isUpdating = false;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthenticationStore>(context);
    final user = store.currentUser;
    if (user == null) return Container();
    return TitleCard(title: "Update Display Name", child: _buildForm(user));
  }

  Widget _buildForm(User user) {
    return FormBuilder(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Row(
          children: [
            Expanded(
                child: FormBuilderTextField(
              name: 'display_name',
              initialValue: user.displayName,
              validator: _validateDisplayName,
              enabled: !isUpdating,
            )),
            SizedBox(width: 16),
            ElevatedButton(
                onPressed: isUpdating ? null : updateDisplayName,
                child: Text('Update'))
          ],
        ));
  }

  String? _validateDisplayName(String? input) {
    if (input == null || input.isEmpty) return "Please enter a display name";
    if (input.length > 9)
      return "We can't allow such long display names due to security reasons";
  }

  Future<void> updateDisplayName() async {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() == true) {
      final Map<String, dynamic> values = _formKey.currentState?.value ?? {};
      setState(() {
        isUpdating = true;
      });
      try {
        await Provider.of<AuthenticationStore>(context, listen: false)
            .changeDisplayName(
          values["display_name"],
        );
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred')));
      } finally {
        setState(() {
          isUpdating = false;
        });
      }
    }
  }
}
