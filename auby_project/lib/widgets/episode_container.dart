import 'package:flutter/material.dart';
import '../model/global.dart';
import '../screens/episode_page.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

typedef void OnError(Exception exception);

class EpisodeContainer extends StatefulWidget {
  final int index;

  EpisodeContainer(this.index);

  @override
  _EpisodeContainerState createState() => _EpisodeContainerState();
}

class _EpisodeContainerState extends State<EpisodeContainer> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  bool controlState = true;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EpisodePage(widget.index)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        height: 110,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.grey[50]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage('${dummyData[widget.index]['image']}'),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${dummyData[widget.index]['title']}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${dummyData[widget.index]['subtitle']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                        fontSize: 13),
                  ),
                  Text(
                    '${dummyData[widget.index]['duration']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.more_horiz,
                  color: highlightColor,
                  size: 25,
                ),
                IconButton(
                  onPressed: (){
                    if (controlState){
                      audioCache.play('${dummyData[widget.index]['music']}');
                    }else{
                      advancedPlayer.pause();
                    }

                    setState(() {
                      controlState = !controlState;
                    });
                  },
                  icon: Icon(
                    controlState ? Icons.play_circle_outline : Icons.pause_circle_outline,
                    color: highlightColor,
                    size: 35,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
