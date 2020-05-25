import 'package:auby_project/model/global.dart';
import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

typedef void OnError(Exception exception);

class AudioPlayerWidget extends StatefulWidget {

  final int index;

  AudioPlayerWidget(this.index);


  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayerWidget> {

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool controlState = true;
  bool repeat = false;
  bool shuffle = false;
  int firstState = 0;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }


  Widget slider() {
    return Slider(
        activeColor: Colors.black,
        inactiveColor: buttonColor,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  void changeControllState() {
    setState(() {
      controlState = !controlState;
      firstState++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 150,
        child: Column(
          children: [
            slider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.repeat),
                  iconSize: 20,
                  color: repeat ? Colors.lightGreenAccent[700] : Colors.grey[800],
                  onPressed: () {
                    setState(() {
                      repeat = !repeat;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.fast_rewind),
                  iconSize: 30,
                  color: buttonColor,
                  onPressed: () {
                    advancedPlayer.resume();
                    advancedPlayer.stop();
                    if (!controlState) {
                      advancedPlayer.resume();
                    }
                  },
                ),
                IconButton(
                  icon: controlState
                      ? Icon(Icons.play_circle_outline)
                      : Icon(Icons.pause_circle_outline),
                  iconSize: 70,
                  color: buttonColor,
                  onPressed: () {
                    print(firstState);

                    if (controlState) {
                      if (firstState == 0) {
                        audioCache.play('${dummyData[widget.index]['music']}');
                      } else {
                        advancedPlayer.resume();
                      }
                    } else {
                      advancedPlayer.pause();
                    }

                    changeControllState();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.fast_forward),
                  iconSize: 30,
                  color: buttonColor,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shuffle),
                  iconSize: 20,
                  color: shuffle ? Colors.lightGreenAccent[700] : Colors.grey[800],
                  onPressed: () {
                    setState(() {
                      shuffle = !shuffle;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
