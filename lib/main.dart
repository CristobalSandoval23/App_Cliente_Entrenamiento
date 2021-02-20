import 'dart:math';

import 'package:app_cliente_entrenamiento/src/chart2.dart';
import 'package:app_cliente_entrenamiento/src/graph_widget.dart';
import 'package:app_cliente_entrenamiento/src/sample10.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

import 'package:app_cliente_entrenamiento/src/sample12.dart';
import 'package:app_cliente_entrenamiento/src/sample14.dart';
import 'package:app_cliente_entrenamiento/src/sample13.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var data;
  @override
  void initState() { 
    super.initState();
    var r = Random();
    data = List<double>.generate(30, (index) => r.nextDouble() * 1500);
  }

  _onTap(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(),
          body: widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bezier Chart Sample"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Sample 1"),
              subtitle: Text("Number Chart"),
              onTap: () => _onTap(
                context,
                sample1(context),
              ),
            ),
            ListTile(
              title: Text("Sample 10"),
              subtitle: Text("Dynamic date range"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample10())),
            ),
            ListTile(
              title: Text("Sample 12"),
              subtitle: Text("Dynamic date range"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample12())),
            ),
            ListTile(
              title: Text("Sample 13"),
              subtitle: Text("Dynamic date range"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample13())),
            ),
            ListTile(
              title: Text("Sample 14"),
              subtitle: Text(
                  "Sample with updatePositionOnTap & format indicator value"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample14())),
            ),
            ListTile(
              title: Text("Sample 14"),
              subtitle: Text(
                  "Sample with updatePositionOnTap & format indicator value"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LineChartSample2())),
            ),
            ListTile(
              title: Text("Sample 145"),
              subtitle: Text(
                  "Sample with updatePositionOnTap & format indicator value"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BarChartSample1())),
            ),
          ],
        ),
      ),
    );
  }
}


//SAMPLE CUSTOM VALUES
Widget sample1(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black54,
          Colors.black87,
          Colors.black87,
          Colors.black,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Bezier Chart - Numbers",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        Center(
          child: Card(
            elevation: 12,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                selectedValue: 30,
                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                footerValueBuilder: (double value) {
                  return "${formatAsIntOrDouble(value)}\ndays";
                },
                series: const [
                  BezierLine(
                    label: "m",
                    data: const [
                      DataPoint<double>(value: 10, xAxis: 0),
                      DataPoint<double>(value: 130, xAxis: 5),
                      DataPoint<double>(value: 50, xAxis: 10),
                      DataPoint<double>(value: 150, xAxis: 15),
                      DataPoint<double>(value: 75, xAxis: 20),
                      DataPoint<double>(value: 0, xAxis: 25),
                      DataPoint<double>(value: 5, xAxis: 30),
                      DataPoint<double>(value: 45, xAxis: 35),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                  startYAxisFromNonZeroValue: false,
                  bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                  footerHeight: 40,
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  verticalIndicatorFixedPosition: false,
                  displayYAxis: true,
                  stepsYAxis: 10,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.red[300],
                      Colors.red[400],
                      Colors.red[400],
                      Colors.red[500],
                      Colors.red,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  snap: true,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
