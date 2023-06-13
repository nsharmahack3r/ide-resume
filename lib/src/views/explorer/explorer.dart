import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_pro/src/providers/common_providers.dart';
import 'package:resume_pro/src/resource/strings.dart';
import 'package:resume_pro/src/views/explorer/widgets/explorer_item_folder.dart';

class ExplorerPane extends StatelessWidget {
  const ExplorerPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      width: 250,
      child: Consumer(
        builder: (context, ref, child) {
          // final folderList = ref.watch(foldersProvider);
          return ListView(
            children: [
              ExplorerItemFolder(
                title: ExplorerString.introductionLabel, 
                files: ref.watch(introFilesProvider),
              ),
              ExplorerItemFolder(
                title: ExplorerString.projectsLabel, 
                files: ref.watch(projectFilesProvider),
              ),
              ExplorerItemFolder(
                title: ExplorerString.experienceLabel, 
                files: ref.watch(experienceFilesProvider),
              ),
              ExplorerItemFolder(
                title: ExplorerString.educationLabel, 
                files: ref.watch(educationFilesProvider),
              )
            ],
          );
        }
      ),
    );
  }
}
