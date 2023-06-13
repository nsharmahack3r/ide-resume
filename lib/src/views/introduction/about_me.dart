import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/resource/strings.dart';

class AboutMeFile extends StatelessWidget {
  const AboutMeFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  ImageAssets.profleImageJPG,
                  height: 90,
                  width: 90,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                ProfileString.firstLine,
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 300,
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText(
                  ProfileString.bio,
                  speed: const Duration(milliseconds: 30),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
