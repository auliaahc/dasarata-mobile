import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartHomeWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const ChartHomeWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                color: ColorConstant.secondaryColor,
                spots: _getDataSpots(),
                isCurved: true,
                belowBarData: BarAreaData(show: true),
              ),
            ],
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < data.length) {
                      return Text(
                        data[index]["month"],
                        style: TextStyleConstant.regularCaption
                      );
                    }
                    return Container();
                  },
                  interval: 1,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value % 50 == 0) {
                      return Text(
                        '${value.toInt()}',
                        style: TextStyleConstant.regularCaption
                      );
                    }
                    return Container();
                  },
                  reservedSize: 40,
                ),
              ),
              topTitles: const AxisTitles(),
            ),
            gridData: const FlGridData(
              show: true,
              horizontalInterval: 50,
              verticalInterval: 1,
            ),
            borderData: FlBorderData(
              border: Border.all(
                color: ColorConstant.neutralColor500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _getDataSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      spots.add(
        FlSpot(
          i.toDouble(),
          data[i]["total"].toDouble(),
        ),
      );
    }
    return spots;
  }
}