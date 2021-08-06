import 'package:flutter/material.dart';

class Shifts extends StatefulWidget {

  List<String> pastshifts;
  Shifts( this.pastshifts, { Key? key }) : super(key: key);

  @override
  _ShiftsState createState() => _ShiftsState();
}

class _ShiftsState extends State<Shifts> {
  bool tileState = true;



  Color tileColors(){
    if(tileState){
      tileState = false;
      return Colors.deepPurple.shade100;
    }
    else{
      tileState = true; 
      return Colors.green.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: true,
            itemCount: widget.pastshifts.length,
            itemBuilder: (BuildContext context, int index) {
              
            return Container(
                height: 50,
                color: tileColors(),
                child: ListTile(
                  title: Text(widget.pastshifts[index]),
                  ),
                 
              );
            }
            ),
        ),
    );
  }
}
