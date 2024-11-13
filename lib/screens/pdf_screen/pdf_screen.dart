import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_online/controllers/pdf_controller.dart';
import 'package:pdf_online/widgets/loading_widget.dart';

class PdfScreen extends StatefulWidget {
  final String folderName;
  const PdfScreen({super.key, required this.folderName});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> with AfterLayoutMixin {
  /// MARK: - Initials;
  final _controller = Get.put(PdfController());
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _controller.getAllPDF(folderName: widget.folderName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF'),
      ),
      body: Obx(
        () {
          if (_controller.isLoading.value) {
            return LoadingWidget();
          }
          return ListView.builder(
            itemCount: _controller.pdfs.length,
            itemBuilder: (context, index) {
              final pdf = _controller.pdfs[index];
              return ListTile(
                title: Text(pdf.name),
                subtitle: Text(pdf.createdAt.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
