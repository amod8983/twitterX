import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  final File file;
  final String name;
  final String extension;

  FileModel({required this.file})
      : name = path.basename(file.path),
        extension = path.extension(file.path);

  @override
  List<Object?> get props => [name, extension];
}
