import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFFileBody extends StatelessWidget {
  const PDFFileBody({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath: path,
          enableSwipe: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          fitPolicy: FitPolicy.BOTH,
          defaultPage: 0,
          preventLinkNavigation: false,
        ),
      ],
    );
  }
}
