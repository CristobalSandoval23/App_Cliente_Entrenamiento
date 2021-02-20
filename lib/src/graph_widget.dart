import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class LineChartSample2 extends StatefulWidget {
@override
_LineChartSample2State createState() => _LineChartSample2State();
}
class _LineChartSample2State extends State<LineChartSample2> {
  List<FlSpot> _items;
  List<double> _xAxis;
    double x;
    double y;

  void _loadData() async {
    await Future.delayed(Duration(seconds: 0));
    final String data =
        '[{"Day":2,"Value":"5"},{"Day":3,"Value":"100"},{"Day":4,"Value":"6"}]';
    final List list = json.decode(data);
    setState(() {
      _items = list
          .map((item) => FlSpot(
              double.parse(item["Day"].toString()),
              double.parse(item["Value"].toString())))
          .toList();
      _xAxis =
          list.map((item) => double.parse(item["Day"].toString())).toList();
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

List<Color> gradientColors = [
const Color(0xff23b6e6),
const Color(0xff02d39a),
];
bool showAvg = false;
@override
Widget build(BuildContext context) {
return Column(
 children: <Widget>[
SizedBox( height: 200, ),
Stack(
 children: <Widget>[
AspectRatio(
 aspectRatio: 1.70,
 child: Container(
 decoration: const BoxDecoration(
 borderRadius: BorderRadius.all(
Radius.circular(25), // bordes del chart
),
 color: Color(0xff232d37)
),
 child: Padding(
 padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
 child: LineChart(
 mainData(),
),
),
),
),
SizedBox(
 width: 400,
 height: 18,
 child: FlatButton(
 onPressed: () {
 setState(() {
 showAvg = !showAvg;
});
},
 child: Text(
'Evolución ',
 style: TextStyle(
 fontSize: 16, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
),
),
),
],
),
],
);
}
LineChartData mainData() {
return LineChartData(
 gridData: FlGridData(
 show: true, // elimina las rayas que estan detras del grafico
 drawVerticalLine: true, // si esta en false elimina las lineas verticales
 getDrawingHorizontalLine: (value) {
return FlLine(
 color: const Color(0xff37434d),
 strokeWidth: 1, // amplia el tamaño de las lineas horizontales del fondo del grafico
);
},
 getDrawingVerticalLine: (value) {
return FlLine(
 color: const Color(0xff37434d),
 strokeWidth: 1, // amplia el tamaño de las lineas verticales del fondo del grafico
);
},
),
 titlesData: FlTitlesData(
 show: true, // si este esta en false elimina los datos tanto de la left como de down del grafico
 bottomTitles: SideTitles(
 showTitles: true, // si esta en false elimina los datos del lado down del grafico
 reservedSize: 22, // le da el alto al grafico si se reduce y al contrario si se aumenta se achica el chart
//  getTextStyles: TextStyle(color: Color(0xff68737d)),
 getTitles: (value) {
switch (value.toInt()) {
case 1:
return 'MAR';
case 5:
return 'JUN';
case 8:
return 'SEP';
}
return '';
},
 margin: 8,
),
 leftTitles: SideTitles(
 showTitles: true, // si esta en false elimina los datos del lado left del grafico
// getTextStyles:
//    TextStyle(
//      color: Colors.white,
//    ),
 getTitles: (value) {
switch (value.toInt()) {
// aqui se carga los datos automaticamente
case 100:
return '100k';
case 200:
return '30k';
case 330:
return '50k';
}
return '';
},
 reservedSize: 28,
 margin: 12,
),
),
 borderData:
FlBorderData(
// le da el color al fondo del grafico
 show: true, border: Border.all(color: const Color(0xff37434d), width: 1)
),
// los datos de abajo permiten alterar el grafico
 minX: 0,
 maxX: 10, // aqui puedo colocar length para designar la máxima cantidad de datos
 minY: 0,
 maxY: 330, // aqui puedo colocar length para designar la máxima cantidad de datos
 lineBarsData: [
LineChartBarData(
 spots: _items,
//   [
// // pide por fuerza un dato por ende necesito crear una menra de dejar un dato ya listo para que el momento en que dentrael primer dato no se muestre
// FlSpot(2, 155),
// FlSpot(3, 231),
// FlSpot(4, 233),
// FlSpot(5, 235),
// FlSpot(6, 231),
// FlSpot(7, 324),
// FlSpot(8, 233),
// FlSpot(9, 224),
// ],
 isCurved: false, // le da la curva a la linea del grafico
 colors: gradientColors, // color de la linea del grafico
 barWidth: 5, // grosor de la linea del grafico
 isStrokeCapRound: true, // si es falso indica que no se debe sobresalir del la ubicación del dato
 dotData: FlDotData(
 show: true, // si se coloca en true es para colocar los puntos de los datos
),
 belowBarData: BarAreaData(
 show: true, // este al estar en true da la sombra del grafico hacia abajo
 colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(), // le asigna un color a la sombra del grafico
),
),
],
);
}
}