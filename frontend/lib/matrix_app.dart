import 'package:flutter/material.dart';
import 'package:matrixenergygrid/middlewares/authentication_middleware.dart';
import 'package:matrixenergygrid/screens/dashboard/dashboard_screen.dart';
import 'package:matrixenergygrid/screens/login/login_screen.dart';

const Color matrixGreen = Color(0xFF008F11);

class MatrixApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix Energy Grid Inc.',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: _buildThemeData(context),
      home: AuthenticationMiddleware(
        authenticatedChild: DashboardScreen(),
        unauthenticatedChild: LoginScreen(),
      ),
    );
  }

  ThemeData _buildThemeData(BuildContext context) {
    return ThemeData(
        primarySwatch: MaterialColor(0xFF008F11, {}),
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF0D0208),
        scaffoldBackgroundColor: Color(0xFF0D0208),
        primaryColor: Color(0xFF0D0208),
        primaryColorDark: Color(0xFF0D0208),
        accentColor: matrixGreen,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: matrixGreen,
              displayColor: matrixGreen,
              fontFamily: 'VT323',
              fontSizeFactor: 1.5,
            ),
        buttonColor: matrixGreen,
        appBarTheme: AppBarTheme(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: matrixGreen,
                displayColor: matrixGreen,
                fontFamily: 'VT323',
                fontSizeFactor: 1.5,
              ),
        ),
        shadowColor: Colors.transparent,
        fontFamily: 'VT323',
        cardColor: Color(0xFF0D0208).withOpacity(0.5),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: matrixGreen),
          ),
        ),
        dialogBackgroundColor: Color(0xFF0D0208));
  }
}
