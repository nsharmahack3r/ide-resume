import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityExtraFile extends StatelessWidget {
  const CommunityExtraFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("I Love to speak at flutter community events!", style: TextStyle(fontSize: 20),),
          const SizedBox(height: 20,),
          Image.asset(ImageAssets.speakerShowCase, height: 400,),
          const SizedBox(height: 20,),
          MaterialButton(
            color: Colors.blueGrey,
            onPressed: (){
              _launchUrl(Uri.parse("https://www.youtube.com/watch?v=SSv3Jx-zjR4&t=2541s"));
            },
            child: const Text("Watch recorded Session"),
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    //throw Exception('Could not launch $_url');
  }}
}