import 'package:flutter/material.dart';

class buttons extends StatefulWidget {
  Function start;
  Function reset;
  buttons({ Key? key, required this.start, required this.reset }) : super(key: key);

  @override
  _buttonsState createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  
  var startStop = 'Clock In';
  var timeState = false;
 

  @override
  Widget build(BuildContext context) {
    return 
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
                  onPressed: widget.start(), 
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
              onPressed: widget.reset(), 
              child: Text("End Shift"),
              ),
              ]
    );
  }
}