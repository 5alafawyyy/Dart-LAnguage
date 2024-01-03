import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../data/book_model/book_model.dart';

class PdfViewerViewBody extends StatefulWidget {
  const PdfViewerViewBody({super.key, required this.book});
  final BookModel book;

  @override
  State<PdfViewerViewBody> createState() => _PdfViewerViewBodyState();
}

class _PdfViewerViewBodyState extends State<PdfViewerViewBody> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int page = 1;
    double zoomLevel = 1.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Color.fromARGB(255, 230, 215, 14),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _pdfViewerStateKey.currentState!.openBookmarkView();
              },
              icon: const Icon(
                Icons.bookmark,
                color: Color.fromARGB(255, 230, 215, 14),
              ),
            ),
            IconButton(
              onPressed: () {
                _pdfViewerController.jumpToPage(++page);
              },
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Color.fromARGB(255, 230, 215, 14),
              ),
            ),
            IconButton(
              onPressed: () {
                zoomLevel = (zoomLevel <= 1) ? 1 : zoomLevel - 0.25;
                _pdfViewerController.zoomLevel = zoomLevel;
              },
              icon: const Icon(
                Icons.zoom_out,
                color: Color.fromARGB(255, 230, 215, 14),
              ),
            ),
            IconButton(
              onPressed: () {
                zoomLevel = zoomLevel + 0.25;
                _pdfViewerController.zoomLevel = zoomLevel;
              },
              icon: const Icon(
                Icons.zoom_in,
                color: Color.fromARGB(255, 230, 215, 14),
              ),
            ),
          ],
        ),
        body: SfPdfViewer.network(
          'https://books.googleusercontent.com/books/content?req=AKW5QacLmNA8AzNw0VKCuDQ2lIkGHzYLc-rK8iSXk9dZWWveqLNMTnBijVYUfywpNTRof7WC9sw-6t8BqypkwMnJC4irptKiz6OTW-z-Rfkk3cOtfiSaert4y6CZydmRPut9qpQXui-QIHfZyfPVEN7PehkcIBoGJXZMrFbzy0eE3fTqR0am3LD0ItIfLjzqWwqxGIi251_UQlqGu6VEk43AgZkfHkch9I2pWuQHYwMcJ1wiR-TZIsQZw76sQ8Kq4rqhX6eQd0PgESigTIUQDc0vvfAg6IGvEVdxV7fflClKbSehg6rEQnI',
          // widget.book.accessInfo!.pdf!.downloadLink!,
          controller: _pdfViewerController,
          key: _pdfViewerStateKey,
        ),
      ),
    );
  }
}
