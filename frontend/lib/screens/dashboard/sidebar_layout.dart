import 'package:flutter/material.dart';
import 'package:matrixenergygrid/screens/dashboard/sidebar.dart';

class SidebarLayout extends StatefulWidget {
  const SidebarLayout({Key? key, required this.pages}) : super(key: key);

  final Map<String, WidgetBuilder> pages;

  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Sidebar(
          pages: widget.pages.keys.toList(),
          onSelectPage: _selectPage,
          selectedPage: _selectedPage,
        ),
        VerticalDivider(),
        Expanded(
          child: widget.pages.values.toList()[_selectedPage].call(context),
        ),
      ],
    );
  }

  _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
