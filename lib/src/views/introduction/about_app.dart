import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/resource/strings.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageAssets.appIconPng,
              height: 200,
            ),
            const Text(
              CommonString.appName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(CommonString.tagLine),
            const SizedBox(
              height: 10,
            ),
            AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText(
                  CommonString.info,
                  speed: const Duration(milliseconds: 50)
                ),
              ],
            ),
            //const Text(CommonString.info),
          ],
        ),
      ),
    );
  }
}
