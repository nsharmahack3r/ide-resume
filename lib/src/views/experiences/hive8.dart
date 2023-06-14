import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/views/experiences/base_experience.dart';

class Hive8Experience extends StatelessWidget {
  const Hive8Experience({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const BaseExperience(
      companyLogo: ImageAssets.hive8logoPng,
      company: "Hive8, Mumbai, Inida", 
      tagLine: "Co working space providers",
      fromAndTo: "11/2022 - 05/2023",
      tasks: [
        "Built a chat App in Flutter for Android and IOS",
        "Integrated with Firebase and Node.js",
        "Distributed apps to Playstore and appstore",
        "Developed backend APIs with Socket.io",
      ], 
      post: "Flutter Developer",
    );
  }
}
