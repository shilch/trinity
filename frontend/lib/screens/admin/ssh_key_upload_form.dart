import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:matrixenergygrid/api.dart';
import 'package:matrixenergygrid/widgets/title_card.dart';

class SSHKeyUploadForm extends StatefulWidget {
  @override
  _SSHKeyUploadFormState createState() => _SSHKeyUploadFormState();
}

class _SSHKeyUploadFormState extends State<SSHKeyUploadForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isUpdating = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TitleCard(
          title: 'Replace maintenance SSH key',
          child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    enabled: false,
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: "Username", alignLabelWithHint: true),
                    controller: TextEditingController(text: 'bastion'),
                  ),
                  FormBuilderTextField(
                    name: 'key',
                    maxLines: 10,
                    validator: validateSSHKey,
                    enabled: !isUpdating,
                    decoration: InputDecoration(
                        labelText: 'SSH-Key', alignLabelWithHint: true),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: isUpdating ? null : replaceSSHKey,
                      child: Text("Update")),
                ],
              )),
        )
      ],
    );
  }

  Future<void> replaceSSHKey() async {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() == true) {
      final Map<String, dynamic> values = _formKey.currentState?.value ?? {};
      setState(() {
        isUpdating = true;
      });
      try {
        await openApi.getDefaultApi().replaceSSHKey(
            key: values['key'], extra: {"withCredentials": true});
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Update successful!')));
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

  String? validateSSHKey(String? key) {
    if (key == null) return "Please enter a SSH key";
    return RegExp("ssh-[a-zA-Z0-9]+ AAAA[0-9A-Za-z+/]+[=]{0,3}( [^@]+@[^@]+)?")
            .hasMatch(key)
        ? null
        : "Please enter a valid public SSH key";
  }
}
