import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final List<String> pages;
  final Function(int index) onSelectPage;
  final int? selectedPage;

  const Sidebar({
    Key? key,
    required this.pages,
    required this.onSelectPage,
    this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            pages[index],
            style: TextStyle(
              decoration: index == selectedPage
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
          onTap: () => onSelectPage(index),
          selected: index == selectedPage,
        ),
        separatorBuilder: (context, _) => Divider(),
        itemCount: pages.length,
      ),
    );
  }
}
