import 'package:flutter/material.dart';
import 'package:matrixenergygrid/matrix_app.dart';

class AccessRestrictedMessage extends StatelessWidget {
  const AccessRestrictedMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock,
                size: 56,
                color: matrixGreen,
              ),
              Text('Access denied', style: TextStyle(fontSize: 48)),
              Text('This page requires you to have admin permissions.')
            ],
          ),
        ),
      ),
    );
  }
}
