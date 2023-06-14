import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_pro/src/providers/common_providers.dart';
import 'package:resume_pro/src/views/experiences/hive8.dart';
import 'package:resume_pro/src/views/experiences/tutorang.dart';
import 'package:resume_pro/src/views/explorer/explorer.dart';
import 'package:resume_pro/src/views/extra/community.dart';
import 'package:resume_pro/src/views/extra/youtube.dart';
import 'package:resume_pro/src/views/introduction/about_app.dart';
import 'package:resume_pro/src/views/introduction/about_me.dart';
import 'package:resume_pro/src/views/projects/dartbucket.dart';
import 'package:resume_pro/src/views/projects/davfest_portfolio.dart';
import 'package:resume_pro/src/views/projects/unitron.dart';
import 'package:resume_pro/src/views/statusbar/status_bar.dart';
import 'package:resume_pro/src/views/terminal/terminal.dart';
import 'package:resume_pro/src/views/toolbar/toolbar.dart';

class AppWindow extends StatelessWidget {
  const AppWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ToolBar(),
          Flexible(
            child: Row(
              children: [
                const ExplorerPane(),
                Consumer(
                  builder: (context, ref, child) {
                    final index = ref.watch(selectedFileIdProvider);
                    switch (index) {
                      case -1:
                        return const AboutApp();
                      case 0:
                        return const AboutMeFile();
                      case 1:
                        return const DartBucketProject();
                      case 2:
                        return const DevfestPortfolioProject();
                      case 3:
                        return const UnitronProject();
                      case 4:
                        return const Hive8Experience();
                      case 5:
                        return const TutorangExperience();
                      case 6:
                        return const YoutubeExtraFile();
                      case 7:
                        return const CommunityExtraFile();
                      default:
                        return const AboutApp();
                    }
                  },
                ),
              ],
            ),
          ),
          const Terminal(),
          const StatusBar(),
        ],
      ),
    );
  }
}
