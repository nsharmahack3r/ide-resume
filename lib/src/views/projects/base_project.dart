import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseProject extends StatelessWidget {
  const BaseProject({
    super.key,
    required this.title,
    required this.tagLine,
    required this.description,
    required this.imageAsset,
    required this.carousel, required this.projectUrl,
  });

  final String title;
  final String tagLine;
  final String description;
  final String imageAsset;
  final Widget carousel;
  final String projectUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                imageAsset,
                height: 90,
                width: 90,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    tagLine,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          carousel,
          const SizedBox(height: 10,),
          MaterialButton(
            color: Colors.blueGrey,
            onPressed: (){
              launchUrl(Uri.parse(projectUrl));
            },
            child: const Text("View")
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Description:", style: TextStyle(fontSize: 18),),
          Text(description, style: const TextStyle(fontSize: 18),),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    //throw Exception('Could not launch $_url');
  }
}
}
