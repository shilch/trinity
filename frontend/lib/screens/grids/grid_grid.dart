import 'package:flutter/material.dart';
import 'package:matrixenergygrid/screens/grids/grid_card.dart';
import 'package:openapi/openapi.dart';

class GridGrid extends StatelessWidget {
  final List<Grid> grids;

  const GridGrid({Key? key, required this.grids}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 320,
      children: grids.map((grid) => GridCard(grid: grid)).toList(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 4 / 2,
    );
  }
}
