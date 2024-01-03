import 'package:booklify/features/home/data/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'widgets/pdf_viewer_view_body.dart';

class PdfViewerView extends StatelessWidget {
  const PdfViewerView({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return PdfViewerViewBody(book: book);
  }
}
