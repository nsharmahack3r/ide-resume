import 'package:flutter/material.dart';

class BaseExperience extends StatelessWidget {
  const BaseExperience({super.key, required this.company, required this.tagLine, required this.fromAndTo, required this.tasks, required this.post, required this.companyLogo});

  final String companyLogo;
  final String company;
  final String post;
  final String tagLine;
  final String fromAndTo;
  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                companyLogo,
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
                    "$post at $company",
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
          Text(
            fromAndTo,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            "Tasks :",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...buildTasks(),
        ],
      ),
    );
  }
  buildTasks(){
    final taskWidgets = [];
    for(String task in tasks){
      taskWidgets.add(Text("- $task", style: TextStyle(
        fontSize: 24,
      ),));
    }
    return taskWidgets;
  }
}
