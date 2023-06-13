import 'package:flutter/material.dart';
import 'package:resume_pro/src/core/models/resume_file.dart';
import 'package:resume_pro/src/views/explorer/widgets/explorer_item_file.dart';

class ExplorerItemFolder extends StatefulWidget {
  const ExplorerItemFolder({Key? key,required this.files, required this.title})
      : super(key: key);

  final String title;
  final List<ResumeFile> files;

  @override
  State<ExplorerItemFolder> createState() => _ExplorerItemFolderState();
}

class _ExplorerItemFolderState extends State<ExplorerItemFolder> {

  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  expanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                  size: 12,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.folder,
                  size: 18,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        expanded ? ListView.builder(
          padding: const EdgeInsets.only(left: 20),
          itemCount: widget.files.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => ExplorerItemFile(file: widget.files[index],),
        ) : const SizedBox.shrink(),
      ],
    );
  }
}
