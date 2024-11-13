import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:pdf_online/controllers/pdf_controller.dart';
import 'package:path/path.dart';

class PdfViewerScreen extends StatefulWidget {
  final File file;
  const PdfViewerScreen({super.key, required this.file});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen>
    with AfterLayoutMixin {
  //
  final _controller = Get.put(PDFController());
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
