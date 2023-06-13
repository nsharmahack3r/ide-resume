import 'package:flutter/material.dart';

class BaseProject extends StatelessWidget {
  const BaseProject({
    super.key,
    required this.title,
    required this.tagLine,
    required this.description,
    required this.imageAsset,
    required this.carousel,
  });

  final String title;
  final String tagLine;
  final String description;
  final String imageAsset;
  final Widget carousel;

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
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    tagLine,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          carousel,
          Text("Description:", style: TextStyle(fontSize: 18),),
          Text(description, style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}
