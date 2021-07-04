import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class GridCard extends StatelessWidget {
  final Grid grid;

  const GridCard({Key? key, required this.grid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildLeftPart()),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildPowerDisplay(),
          )),
        ],
      ),
    ));
  }

  Widget _buildLeftPart() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildName(),
          _buildGridId(),
          _buildStatus(),
        ],
      );

  Widget _buildPowerDisplay() => AutoSizeText(
        "${grid.power}\nMW",
        maxLines: 2,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 48,
          height: 0.8,
        ),
      );

  Widget _buildName() => AutoSizeText(
        grid.name ?? 'UNKNOWN',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildGridId() => AutoSizeText(
        "#${grid.id}",
        maxLines: 1,
        style: TextStyle(
          fontSize: 20,
        ),
      );

  Widget _buildStatus() => AutoSizeText(
        grid.online ?? false ? "ONLINE" : "OFFLINE",
        maxLines: 1,
        style: TextStyle(
          fontSize: 28,
          color: grid.online ?? false ? Colors.green : Colors.red,
        ),
      );
}
