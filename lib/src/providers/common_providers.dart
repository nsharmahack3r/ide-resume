import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_pro/src/core/models/folder.dart';
import 'package:resume_pro/src/core/models/resume_file.dart';
import 'package:resume_pro/src/resource/strings.dart';

final selectedFolderIdProvider = StateProvider<int>((ref) => -1);

final selectedFileIdProvider = StateProvider<int>((ref) => -1);

final foldersProvider = Provider((ref) => [
  Folder(id: 0, name: ExplorerString.introductionLabel),
  Folder(id: 1, name: ExplorerString.projectsLabel),
  Folder(id: 2, name: ExplorerString.educationLabel),
  Folder(id: 3, name: ExplorerString.experienceLabel),
]);

final introFilesProvider = Provider((ref) => [
  ResumeFile(name: 'about.me', id: 0),
]);


final projectFilesProvider = Provider((ref) => [
  ResumeFile(name: 'dart_bucket.proj', id: 1),
  ResumeFile(name: 'devfest_portfolio.proj', id: 2),
  ResumeFile(name: 'unitron.proj', id: 3),
]);

final experienceFilesProvider = Provider((ref) => [
  ResumeFile(name: 'hive8.exp', id: 4),
  ResumeFile(name: 'tutorang.exp', id: 5),
]);

final educationFilesProvider = Provider((ref) => [
  ResumeFile(name: 'graduation.edu', id: 6),
  ResumeFile(name: 'intermidiate.edu', id: 7),
  ResumeFile(name: 'highschool.edu', id: 8),
]);