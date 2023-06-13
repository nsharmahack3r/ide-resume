import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/resource/strings.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(ImageAssets.appIconPng),
            const SizedBox(width: 10,),
            const Text(CommonString.appName),
            const Spacer(),
            InkWell(
              onTap: (){},
              child: Icon(Icons.play_arrow, color: Colors.green,),
            )
          ],
        ),
      ),
    );
  }
}