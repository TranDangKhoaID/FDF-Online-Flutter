import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_online/api/pdf_api.dart';
import 'package:pdf_online/controllers/pdf_controller.dart';
import 'package:pdf_online/screens/pdf_viewer_screen/pdf_viewer_screen.dart';
import 'package:pdf_online/widgets/loading_widget.dart';

class PdfScreen extends StatefulWidget {
  final String folderName;
  const PdfScreen({super.key, required this.folderName});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> with AfterLayoutMixin {
  /// MARK: - Initials;
  final _controller = Get.put(PDFController());
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
      // body: Obx(
      //   () {
      //     if (_controller.isLoading.value) {
      //       return LoadingWidget();
      //     }
      //     return ListView.builder(
      //       itemCount: _controller.pdfs.length,
      //       itemBuilder: (context, index) {
      //         final pdf = _controller.pdfs[index];
      //         return ListTile(
      //           title: Text(pdf.name),
      //           subtitle: Text(pdf.createdAt.toString()),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: Container(
        child: TextButton(
          onPressed: () async {
            const url =
                'https://aadmhubkggoucofllopw.supabase.co/storage/v1/object/sign/pdf/cv/TranDangKhoa_BE.pdf?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJwZGYvY3YvVHJhbkRhbmdLaG9hX0JFLnBkZiIsImlhdCI6MTczMTQ3MDEzOSwiZXhwIjoxNzMxNTU2NTM5fQ.qPlnzi203j5-tI2D9Pu5vQ_LKPgV8lQBpfiE84dLbuo&t=2024-11-13T03%3A55%3A39.205Z';
            final file = await PDFApi.loadNetWork(url);
            openPDF(context, file);
          },
          child: Text(
            'PDF',
          ),
        ),
      ),
    );
  }

  Future<void> openPDF(BuildContext context, File file) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PdfViewerScreen(
          file: file,
        ),
      ),
    );
  }
}
