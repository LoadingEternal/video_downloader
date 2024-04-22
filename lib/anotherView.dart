
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnotherView extends StatefulWidget {
  String _goTo = "";

  String? get geTgoTo => _goTo;

  AnotherView({super.key,  required String goTo}){
     this._goTo = goTo;
   }
  @override
  State<AnotherView> createState() => _AnotherViewState();

}


class _AnotherViewState extends State<AnotherView> {
  late final WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse(widget._goTo))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            downloadVideo(controller.currentUrl() as String, controller.getTitle() as String);
          },
          child: Icon(Icons.download),
      ),
    );
  }

  Future<void> downloadVideo(String title, String link) async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        link!, "$title", 18);
    print(result);
  }
}
