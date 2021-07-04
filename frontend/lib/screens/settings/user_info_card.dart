import 'package:flutter/material.dart';
import 'package:matrixenergygrid/models/user.dart';
import 'package:matrixenergygrid/stores/authentication_store.dart';
import 'package:matrixenergygrid/widgets/title_card.dart';
import 'package:provider/provider.dart';

class UserInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthenticationStore>(context);
    final user = store.currentUser;
    if (user == null) return Container();
    return TitleCard(title: "User Info", child: _buildTable(user));
  }

  Table _buildTable(User user) {
    return Table(
      columnWidths: {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
      children: [
        _buildTableRow("Display Name", user.displayName),
        _buildTableRow("Username", user.username),
        _buildTableRow("Is Admin?", user.isAdmin ? 'Yes' : 'NO'),
      ],
    );
  }

  _buildTableRow(String label, String value) {
    return TableRow(children: [
      Text(label),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: value == 'NO'
            ? Text(
                value,
                style: TextStyle(color: Colors.red),
              )
            : Text(value),
      ),
    ]);
  }
}
