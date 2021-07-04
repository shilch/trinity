import 'package:flutter/material.dart';
import 'package:matrixenergygrid/api.dart';
import 'package:matrixenergygrid/screens/grids/grid_grid.dart';
import 'package:openapi/openapi.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<Grid>? grids;

  @override
  void initState() {
    super.initState();
    _loadGrids();
  }

  Future<void> _loadGrids() async {
    try {
      final response = await openApi.getDefaultApi().getGrids();
      if (response.statusCode! ~/ 100 != 2) {
        throw Exception();
      }
      setState(() {
        grids = response.data?.toList();
      });
      if (grids == null) {
        Future.delayed(Duration(seconds: 2), _loadGrids);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error while loading grids')));
      Future.delayed(Duration(seconds: 2), _loadGrids);
    }
  }

  @override
  Widget build(BuildContext context) {
    return grids == null
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: _loadGrids, child: GridGrid(grids: grids!));
  }
}
