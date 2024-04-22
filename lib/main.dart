
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:untitled/anotherView.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VideoDownloader(),
    );
  }
}

class VideoDownloader extends StatefulWidget {
  const VideoDownloader({super.key});

  @override
  State<VideoDownloader> createState() => _VideoDownloaderState();
}

class _VideoDownloaderState extends State<VideoDownloader> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        title:  Text("VideoDownloader", style: GoogleFonts.arvo(
          textStyle: TextStyle(fontSize: 30)
        ),
      )),

      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                ), //BoxDecoration
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                        "Platforms", textAlign: TextAlign.left,
                        style: GoogleFonts.pacifico(
                            textStyle : const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                        ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Center(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 5,
                        child:  SizedBox(
                          height: size.height * 0.6,
                          width: size.width * 0.8,
                          child:  Padding(
                            padding: EdgeInsets.all(50),
                            child: Column(
                              children: [
                                navigableAllignement("https://www.youtube.com", Bootstrap.youtube, size.height *0.1),
                                Divider(color: Colors.black),
                                navigableAllignement("https://www.tiktok.com", Icons.tiktok, size.height *0.1),
                                Divider(color: Colors.black,),
                                navigableAllignement("https://www.instagram.com", Bootstrap.instagram, size.height *0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ) // Stack
        ],
      ),
    );
  }

    navigableAllignement(String goto, IconData icon,double size){
    return  InkWell(
      onTap: () {
          setState(() {
            AnotherView view = AnotherView(goTo: goto);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
          });
      },
      child: Icon(icon, size: size)
    );
  }
}

