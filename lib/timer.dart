import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class clock extends StatefulWidget {
  List<String> list;
  clock( { Key? key, required this.list}) : super(key: key);
  
  @override
  _clockState createState() => _clockState();
}

class _clockState extends State<clock> {
  final StopWatchTimer dayTime = StopWatchTimer();
  final _isHours = true;
 var timeState = false;
  var timeGone = '0:00:00';
  var startStop = 'Clock In';
  var displayTime;

void reset(){
  dayTime.onExecute.add(StopWatchExecute.reset);
  timeState = true;
  timeToggle();
  appendList();
  
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
  setState(() { tileState = true; });
 }

 void appendList(){
  widget.list.add(displayTime);
 }
 var tileState = true;
Color tileColors(){
    if(tileState){
      tileState = false;
      return Colors.deepPurple.shade100;
    }
    else{
      tileState = true; 
      return Colors.white;
    }
  }

  double convert2Hours(String time){
    if(time != null){
      time.split(":");
      // for(int i=0;i<time.length; i++){
      //   if(time[i].startsWith("0")){
      //     time[i].replaceFirst("0", "");
      //   }
      //   time[i].replaceRange(0, time[i].length, time[i]+".0");
      // }
      int second = int.parse(time[2]);
      int minute = int.parse(time[1]);
      int hour = int.parse(time[0]);
      // return hour+((minute+(second/60))/60);
      print(hour);
      print(minute);
      return hour+(minute/60);
    }
    return 0;
  }

   double wagePerShift(String time){
     double hours = 2;//convert2Hours(time);
     
     return 12.75*hours;
   }             

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(75),
                margin: EdgeInsets.all(30),
                child: StreamBuilder<int>(
                  stream: dayTime.rawTime,
                  initialData: dayTime.rawTime.value,
                  builder: (context, snapshot){
                  final value = snapshot.data!;
                  displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours, milliSecond: false);
                  return Text(displayTime, 
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 25.0,
                  ),
                  );
                },
                ),
                        
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 5,
                    
                  ),
                  ),
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(150)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.green;
                      return Colors.deepPurple.shade300; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: timeToggle, 
                  child: Text(startStop),
                  ),
                  ElevatedButton(
              style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.fromWidth(150)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.green;
                  return Colors.deepPurple.shade300; // Use the component's default.
                  },
                ),
              ),
              onPressed: reset, 
              child: Text("End Shift"),
              ),
              ],
            ),
            SizedBox(
          height: 360,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: false,
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              
            return Container(
                height: 65,
                padding: EdgeInsets.all(0),
                // widget.list.length-(1+index)
                color: tileColors(),
                child: ListTile(
                  subtitle: Text("\$ ${widget.list[index].split(':')}"),
                  title: Text(widget.list[widget.list.length-(1+index)]),                  
                  ),
                 
              );
            }
            ),
        ),
          ],
        );
  }
}
