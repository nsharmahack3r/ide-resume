import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_pro/src/core/models/resume_file.dart';
import 'package:resume_pro/src/providers/common_providers.dart';

class ExplorerItemFile extends ConsumerWidget {
  const ExplorerItemFile({Key? key, required this.file}) : super(key: key);

  final ResumeFile file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final seletected = ref.watch(selectedFileIdProvider) == file.id;

    return MaterialButton(
      color: seletected ? Colors.grey.shade800 : null,
      onPressed: () {
        ref.read(selectedFileIdProvider.notifier).update((state) => file.id);
      },
      child: Padding(
        padding:const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.description,
              size: 18,
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              file.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
