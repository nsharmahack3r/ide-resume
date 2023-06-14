import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/views/projects/base_project.dart';

class UnitronProject extends StatelessWidget {
  const UnitronProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BaseProject(
        title: "Unitron",
        tagLine: "Unitron is the official of UCER Greater Noida",
        description: "Unitron is secured channel for communication ad collaboration for students and the institution. You get to know about everything going in and out of the college. Providing your phone number is a choice, thus we ensure your privacy and security.",
        imageAsset: ImageAssets.unitronLogoPng,
        carousel: Flexible(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Image.asset(
                ImageAssets.unitronShowcase1,
                height: 400,
              ),
              Image.asset(
                ImageAssets.unitronShowcase2,
                height: 400,
              ),
              Image.asset(
                ImageAssets.unitronShowcase3,
                height: 400,
              ),
              Image.asset(
                ImageAssets.unitronShowcase4,
                height: 400,
              ),
              Image.asset(
                ImageAssets.unitronShowcase5,
                height: 400,
              ),
              Image.asset(
                ImageAssets.unitronShowcase6,
                height: 400,
              ),
            ],
          ),
        ), projectUrl: 'https://play.google.com/store/apps/details?id=com.tweakstron.unitron&hl=en&gl=US',
      ),
    );
  }
}
