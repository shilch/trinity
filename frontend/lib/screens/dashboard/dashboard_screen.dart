import 'package:flutter/material.dart';
import 'package:matrixenergygrid/screens/admin/admin_screen.dart';
import 'package:matrixenergygrid/screens/dashboard/sidebar_layout.dart';
import 'package:matrixenergygrid/screens/documentation/api_documentation.dart';
import 'package:matrixenergygrid/screens/grids/grid_screen.dart';
import 'package:matrixenergygrid/screens/settings/settings_screen.dart';
import 'package:matrixenergygrid/stores/authentication_store.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: SidebarLayout(
          pages: {
            "Dashboard": (context) => GridScreen(),
            "Settings": (context) => SettingsScreen(),
            "Documentation": (context) => APIDocumentation(),
            "Administration": (context) => AdminScreen(),
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Matrix Energy Grid Inc."),
      centerTitle: true,
      actions: [
        TextButton.icon(
            onPressed:
                Provider.of<AuthenticationStore>(context, listen: false).logout,
            icon: Icon(Icons.account_circle),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Provider.of<AuthenticationStore>(context)
                      .currentUser
                      ?.displayName ??
                  "No User"),
            ))
      ],
    );
  }
}
