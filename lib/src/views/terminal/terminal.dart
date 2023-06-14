import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final terminalStateProvider = StateProvider<bool>((ref) {
  return true;
});

class Terminal extends ConsumerWidget {
  const Terminal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if(!ref.watch(terminalStateProvider)){
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          color: Colors.blueGrey.shade700,
          height: 30,
          child: Row(
            children: [
              const Text("Messages"),
              const Spacer(),
              InkWell(
                onTap: (){
                  ref.read(terminalStateProvider.notifier).update((state) => false);
                },
                child: const Icon(Icons.close),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          color: Colors.grey.shade900,
          padding: const EdgeInsets.all(10.0),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Building for local testing",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
