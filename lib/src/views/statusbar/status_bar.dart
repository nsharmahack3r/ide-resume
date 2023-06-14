import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        border: const Border(
          top: BorderSide(width: 1, color: Colors.grey)
        )
      ),
      height: 25,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Text("Building to run locally", style: TextStyle(fontSize: 12),),
          // SizedBox(width: 20,),
          // SizedBox(
          //   width: 200,
          //   child: Flexible(
          //     child: LinearProgressIndicator(
          //       color: Colors.grey,
          //     ),
          //   ),
          // ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}