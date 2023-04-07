import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";

import "../controller/markcontroller.dart";

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  final _pdfViewerController = PdfViewerController();
  final pdfurl = Get.arguments["PDFURL"];
  final data = Get.put(Markcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('pdf viewer'),
        ),
        body: SfPdfViewer.network(
          pdfurl,
          controller: _pdfViewerController,
        ),
      ),
    );
  }
}
