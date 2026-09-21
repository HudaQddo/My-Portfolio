import 'package:web/web.dart' as web;

void downloadCv() {
  // Flutter bundles spaces in asset filenames as literal %20 sequences.
  final anchor = web.HTMLAnchorElement()
    ..href = Uri.parse(
      web.document.baseURI,
    ).resolve('assets/assets/resume/HUDA%2520QDDO%2520Resume.pdf').toString()
    ..download = 'HUDA QDDO Resume.pdf';
  web.document.body!.appendChild(anchor);
  anchor.click();
  anchor.remove();
}
