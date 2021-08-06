import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timeapp/timer.dart';

main(List<String> args) {
  runApp(time());
}
 class dayTime {

   List<String> pastShifts = [];
  
  final StopWatchTimer example = StopWatchTimer();
 var timeState = false;
  var timeGone = '0:00:00';
  var startStop = 'Clock In';

void reset(){
  example.onExecute.add(StopWatchExecute.reset);
  timeState = true;
  timeToggle();
}

 void timeToggle(){
   timeState = !timeState;
   if(timeState){
     example.onExecute.add(StopWatchExecute.start);
     startStop = 'Clock Out';
   }
   else{
     example.onExecute.add(StopWatchExecute.stop);
     startStop = 'Clock In';
   }
 }

 }

class time extends StatelessWidget {
   time({ Key? key }) : super(key: key);
  
    List<String> pastShifts = [];
  
  final StopWatchTimer dayTime = StopWatchTimer();
 var timeState = false;
  var timeGone = '0:00:00';
  var startStop = 'Clock In';

void reset(){
  dayTime.onExecute.add(StopWatchExecute.reset);
  timeState = true;
  timeToggle();
}

 void timeToggle(){
   timeState = !timeState;
   if(timeState){
     dayTime.onExecute.add(StopWatchExecute.start);
     startStop = 'Clock Out';
   }
   else{
     dayTime.onExecute.add(StopWatchExecute.stop);
     startStop = 'Clock In';
   }
 }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Management',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Time'),
          backgroundColor: Colors.deepPurple[300],
        ),
        body: Column(children: [
          // circle(testTime(dayTime)),
          // buttons(start: timeToggle, reset: reset),
          clock(list: pastShifts),
          // Shifts(pastShifts),
          
        ],),
      ),
    );
  }
}