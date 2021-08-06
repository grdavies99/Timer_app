import 'package:flutter/material.dart';

class circle extends StatelessWidget {
  final Widget center;
  const circle(this.center, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 5,
                    )
                    ),
      child: center,              
      
      
    );
  }
}