import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timeapp/main.dart';

class testTime extends StatefulWidget {
  dayTime test;
  testTime(this.test, { Key? key }) : super(key: key);

  @override
  _testTimeState createState() => _testTimeState();
}

class _testTimeState extends State<testTime> {
//   var dayTime = widget.test;
//   void reset(){
//   dayTime.onExecute.add(StopWatchExecute.reset);
//   timeState = true;
//   timeToggle();
//   appendList();
  
// }

//  void timeToggle(){
//    timeState = !timeState;
//    if(timeState){
//      dayTime.onExecute.add(StopWatchExecute.start);
//      startStop = 'Clock Out';
//    }
//    else{
//      dayTime.onExecute.add(StopWatchExecute.stop);
//      startStop = 'Clock In';
//    }
//   setState(() { timeGone = dayTime.toString(); });
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Center(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(75),
                margin: EdgeInsets.all(30),
                child: StreamBuilder<int>(
                  // stream: widget.test.rawTime,
                  // initialData: widget.test.rawTime.value,
                  builder: (context, snapshot){
                  final value = snapshot.data!;
                  final displayTime = StopWatchTimer.getDisplayTime(value, hours: true, milliSecond: false);
                  return Text(displayTime, 
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 25.0,
                  ),
                  );
                },
                ),
    ),
    ),);
  }
}