// ignore_for_file: avoid_print

import '../core.dart';

class CoursePdf extends StatefulWidget {
  final Map<String, dynamic> listData;

  const CoursePdf({
    super.key,
    required this.listData,
  });

  @override
  State<CoursePdf> createState() => _CoursePdfState();
}

class _CoursePdfState extends State<CoursePdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          MyHeader(
            titleText: widget.listData['title'],
            showBackButton: true,
          ),
          const SizedBox(
            height: 10,
          ),
          widget.listData['link_pdf'].isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('No Pdf Availabel'),
                  ),
                )
              : Expanded(
                  child: const PDF(
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: true,
                    pageFling: true,
                    nightMode: false,
                    fitEachPage: true,
                  ).cachedFromUrl(
                    widget.listData['link_pdf'],
                    placeholder: (progress) =>
                        Center(child: Text('$progress %')),
                    errorWidget: (error) =>
                        Center(child: Text('Failed to load PDF: $error')),
                  ),
                ),
          const BottomNav()
        ],
      ),
    );
  }
}
