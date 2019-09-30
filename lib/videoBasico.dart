import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosBasico extends StatefulWidget {
  final List<String> links;

  const VideosBasico({Key key, this.links}) : super(key: key);

  @override
  _VideoBasicoState createState() => _VideoBasicoState();

}

class _VideoBasicoState extends State<VideosBasico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text('Videos'),
            centerTitle: true,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: FlatButton(
                    child: Image.asset('img/video-player.png',
                        height: 40, width: 40),
                    color: Colors.blue,
                    onPressed: () {
                        _launchURL("https://youtu.be/fpuoayOZVaA");
                    }),
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: FlatButton(
                    child: Image.asset('img/video-player.png',
                        height: 40, width: 40),
                    color: Colors.blue,
                    onPressed: () {
                        _launchURL("https://youtu.be/fpuoayOZVaA");
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: FlatButton(
                    child: Image.asset('img/video-player.png',
                        height: 40, width: 40),
                    color: Colors.blue,
                    onPressed: () {
                        _launchURL("https://youtu.be/fpuoayOZVaA");
                    }),
              ),
            ),
          ),


        ],
      ),
    );
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