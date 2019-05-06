import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';

class WaterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WaterPageState();
  }
}

class WaterPageState extends State<WaterPage> {
  double _waterSize = 100.0;
  double _allWaterSize = 2300.0;
  double _percent = .0;
  double _waterSizePerUnit = 100.0;

  final String unit = 'ml';

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.toDouble(),
      title: Text('Water Reminder'),
      centerTitle: true,
    );
    final bottomNavigation = BottomAppBar(
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calendar_today,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
    return Scaffold(
        appBar: topAppBar,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.local_drink),
          label: Text('Drink (${_waterSizePerUnit.toInt()}$unit)'),
          backgroundColor: Colors.pinkAccent,
          onPressed: _incrementCounterWater,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavigation,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                16.0,
              ),
              child: ListTile(
                title: Text(
                  'Hello Flutter',
                ),
                subtitle: Text(
                    'Today: ${DateFormat('EEE d MMM').format(DateTime.now())}'),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Expanded(
                        child: new CircularPercentIndicator(
                      radius: 200.0,
                      lineWidth: 13.0,
                      animation: false,
                      percent: _percent <= 1.0 ? _percent : 1.0,
                      center: new Text(
                        '${(_percent * 100).roundToDouble()} %',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      footer: new Text(
                        '$_waterSize / $_allWaterSize $unit',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _incrementCounterWater() {
    _waterSize += _waterSizePerUnit;
    _percent = _waterSize / _allWaterSize;
    setState(() {});
  }
}
