import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final videoUrls = [
  'https://www.youtube.com/watch?v=Jd8Lom3I6Qc&t=1s',
  'https://www.youtube.com/watch?v=2S9oO8MQi0o&t=1s',
];

class YoutubeExtraFile extends StatelessWidget {
  const YoutubeExtraFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  ImageAssets.dartBucketIconPng,
                  height: 90,
                  width: 90,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Youtube/Dartbucket",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "All about flutter, dart and Node.JS",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                
                itemCount: videoUrls.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final videoID =
                      YoutubePlayer.convertUrlToId(videoUrls[index]);

                  return InkWell(
                    onTap: () {
                      _launchUrl(Uri.parse(videoUrls[index]));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                        YoutubePlayer.getThumbnail(videoId: videoID!),
                        // width: 200,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    //throw Exception('Could not launch $_url');
  }}
}
