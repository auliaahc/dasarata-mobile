import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartHomeWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final Color? lineColor;
  const ChartHomeWidget({
    super.key,
    required this.data,
    this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    final xKey = data.first.keys.elementAt(0);
    final yKey = data.first.keys.elementAt(1);
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryXAxis: const CategoryAxis(
        labelStyle: TextStyle(fontSize: 12),
      ),
      primaryYAxis: const NumericAxis(
        labelStyle: TextStyle(fontSize: 12),
      ),
      series: [
        LineSeries<Map<String, dynamic>, String>(
          dataSource: data,
          xValueMapper: (datum, _) => datum[xKey].toString(),
          yValueMapper: (datum, _) => datum[yKey],
          color: lineColor,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}