import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player/youtube_player.dart';

class VideosIntermediario extends StatefulWidget {
  final List<String> links;

  const VideosIntermediario({Key key, this.links}) : super(key: key);

  @override
  _VideoBasicoState createState() => _VideoBasicoState();
}

class _VideoBasicoState extends State<VideosIntermediario> {
  TextEditingController _idController = TextEditingController();
  String id = "fpuoayOZVaA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Videos - Juros Simples'),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: YoutubePlayer(
                    context: context,
                    source: "OkuNOiyEt1o",
                    quality: YoutubeQuality.HD,
                    autoPlay: false,
                  )),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: YoutubePlayer(
                    context: context,
                    source: "yDQofOYCzrU",
                    quality: YoutubeQuality.HD,
                    autoPlay: false,
                  )),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: YoutubePlayer(
                    context: context,
                    source: "b5J2GM39M9M",
                    quality: YoutubeQuality.HD,
                    autoPlay: false,
                  )),
            ],
          ),
        ));
  }

  _launchURL(url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
