import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.h),
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تاريخ نهاية الاشتراك : ",
                  style: TextStyled.font15WhiteLight,
                ),
                Text(
                  "2024/03/2",
                  style: TextStyled.font15WhiteLight,
                ),
              ],
            ),
          ),
          Gap(20.0.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0.r),
                  color: KTheme.chartBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        color: Colors.black.withOpacity(.6),
                        blurRadius: 2)
                  ]),
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Text(
                    "BMI",
                    style: TextStyled.font16White400,
                  ),
                  LineChart(
                    LineChartData(
                      maxX: 180,
                      baselineX: 20,
                      baselineY: 2,
                      maxY: 20,
                      lineBarsData: lineBarsData1,
                      gridData: gridData,
                      borderData: chartBorder(),
                      titlesData: chartTitles(),
                      lineTouchData: chartLineTouchData(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  LineTouchData chartLineTouchData() => const LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
        ),
      );

  FlTitlesData chartTitles() => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: KTheme.mainColor,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(0, 0),
          FlSpot(20, 5),
          FlSpot(35, 2),
          FlSpot(60, 10),
          FlSpot(70, 2),
          FlSpot(140, 15),
          FlSpot(160, 3),
          FlSpot(180, 20),
        ],
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: KTheme.mainColor,
      fontWeight: FontWeight.bold,
      fontSize: 10.sp,
    );
    Text text = Text(
      value.toInt().toString(),
      style: style,
    );

    return SideTitleWidget(
      fitInside: SideTitleFitInsideData.disable(),
      axisSide: meta.axisSide,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlBorderData chartBorder() => FlBorderData(
        show: false,
      );

  FlGridData get gridData => const FlGridData(show: false);
}
