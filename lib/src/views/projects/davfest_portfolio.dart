import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:resume_pro/src/views/projects/base_project.dart';

class DevfestPortfolioProject extends StatelessWidget {
  const DevfestPortfolioProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BaseProject(
        title: "Devfest Portfolio App Mumbai",
        tagLine: "Connect, Share, Lear and Grow with the community",
        description: "An annual event hosted by the Google Developers Group across the world to bring the technology closer to the developers. It is an all day developer conference where we aim to focus on multiple technologies through lightning talks, sessions, workshops, etc.This app showcases the open source contributors across Devfest Community",
        imageAsset: ImageAssets.devfestPortfolioIconPng,
        carousel: Flexible(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            children: [
              Image.asset(
                ImageAssets.devfestPortfolioShowcase1,
                height: 400,
              ),
              const SizedBox(width: 20,),
              Image.asset(
                ImageAssets.devfestPortfolioShowcase2,
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
