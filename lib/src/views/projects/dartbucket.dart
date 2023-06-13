import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/views/projects/base_project.dart';

class DartBucketProject extends StatelessWidget {
  const DartBucketProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BaseProject(
        title: "Dart Bucket",
        tagLine: "Test APIs, Generate Dart Classes and Flutter Widgets",
        description: "A Bucket of tools for Flutter Devs. With 💙 in Flutter for Flutter\n\nThis open-source Flutter application streamlines the process of making REST API calls by offering features such as automatic JSON-to-class conversion and container generation. By eliminating the need for tedious manual coding, users can focus on building their application's functionality and features. With this app, developers can save time and streamline their workflow, ultimately leading to faster, more efficient development.",
        imageAsset: ImageAssets.dartBucketIconPng,
        carousel: Flexible(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Image.asset(
                ImageAssets.dartBucketShowcase2,
                width: 400,
              ),
              Image.asset(
                ImageAssets.dartBucketShowcase1,
                width: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
