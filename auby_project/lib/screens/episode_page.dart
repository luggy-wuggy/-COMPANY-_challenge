import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../widgets/audio_player.dart';
import '../model/global.dart';

class EpisodePage extends StatefulWidget {
  final int index;

  EpisodePage(this.index);

  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  bool subdirectory = false;
  bool like = false;
  bool download = false;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 35, left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.red[50]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: highlightColor,
                  iconSize: 30,
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                  iconSize: 30,
                  color: highlightColor,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage('${dummyData[widget.index]['image']}'),
                  fit: BoxFit.fill,
                )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 320,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 310,
                      height: 60,
                      child: Center(
                        child: AutoSizeText(
                          '${dummyData[widget.index]['title']}',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                          minFontSize: 16,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 40,
                    child: Center(
                      child: AutoSizeText(
                        '${dummyData[widget.index]['subtitle']}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700]),
                        minFontSize: 16,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.subdirectory_arrow_right),
                  onPressed: () {
                    setState(() {
                      subdirectory = !subdirectory;
                    });
                  },
                  iconSize: 35,
                  color: subdirectory ? buttonColor : Colors.grey[500],
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        like = !like;
                      });
                    },
                    iconSize: 35,
                    color: like ? buttonColor : Colors.grey[500]),
                IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        download = !download;
                      });
                    },
                    iconSize: 35,
                    color: download ? buttonColor : Colors.grey[500]),
                IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                    iconSize: 35,
                    color: favorite ? buttonColor : Colors.grey[500]),
              ],
            ),
            Flexible(child: AudioPlayerWidget(widget.index)),
          ],
        ),
      ),
    );
  }
}
