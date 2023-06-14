import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/views/experiences/base_experience.dart';

class TutorangExperience extends StatelessWidget {
  const TutorangExperience({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const BaseExperience(
      companyLogo: ImageAssets.tutorangLogo,
      company: "Tutorang, Remote", 
      tagLine: "Online one to one tutoring for k1 to k12",
      fromAndTo: "03/2021 - 04/2022,",
      tasks: [
        "Made Android and iOS app for the tutor and students",
        "Implemented in app messaging and push notifications",
        "Redesigned the website",
        "Indian version of the website",
      ], 
      post: "SDE Intern",
    );
  }
}
