import 'package:flutter/material.dart';
import 'package:matrixenergygrid/screens/settings/update_display_name_card.dart';
import 'package:matrixenergygrid/screens/settings/user_info_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserInfoCard(),
        UpdateDisplayNameCard(),
      ],
    );
  }
}
