// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() {
    return _ReportsPage();
  }
}

class _ReportsPage extends State<ReportsPage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Center(
  //       child: BarChart(BarChartData(
  //     maxY: 100,
  //     minY: 0,
  //   )));
  // }
  Widget build(BuildContext context) {
    return SafeArea(
      child: SfCircularChart(
        title: ChartTitle(text: 'Employee Reports 2022 - 2023'),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            enableTooltip: true,
          ),
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Present', 300),
      GDPData('Absent', 100),
      GDPData('Extras', 200),
      GDPData('Late', 50),
      GDPData('Oceania', 150),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
