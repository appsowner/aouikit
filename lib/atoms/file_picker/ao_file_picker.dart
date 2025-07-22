import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:aouikit/aouikit.dart';

class AoUiFilePicker extends StatelessWidget {
  final bool allowMultipleFiles;
  final String title;
  final AllowedFileType allowedFileType;
  final List<String>? allowedFileExtensions;
  final Function(List<PlatformFile>?) filesPicked;

  const AoUiFilePicker({
    super.key,
    required this.title,
    this.allowMultipleFiles = false,
    this.allowedFileType = AllowedFileType.any,
    this.allowedFileExtensions,
    required this.filesPicked,
  });

  @override
  Widget build(BuildContext context) {
    return AoUiButton(
      label: title,
      type: AOUIButtonType.primary,
      onPressed: () {
        openFiles();
      },
    );
  }

  Future<void> openFiles() async {
    final allowedExts = allowedFileExtensions ?? [];

    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: allowedFileType.getFileType(),
      allowedExtensions: allowedExts,
      allowMultiple: allowMultipleFiles,
    );

    if (resultFile != null) {
      filesPicked(resultFile.files);
    }
  }
}

enum AllowedFileType { any, media, image, video, audio, custom }

extension AllowedFileTypeExtension on AllowedFileType {
  FileType getFileType() {
    switch (this) {
      case AllowedFileType.any:
        return FileType.any;
      case AllowedFileType.media:
        return FileType.media;
      case AllowedFileType.image:
        return FileType.image;
      case AllowedFileType.video:
        return FileType.video;
      case AllowedFileType.audio:
        return FileType.audio;
      case AllowedFileType.custom:
        return FileType.custom;
    }
  }
}
