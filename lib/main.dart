import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(BackgroundVideo());

class BackgroundVideo extends StatefulWidget {

  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffb55e28),
        accentColor: Color(0xffffd544),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              LoginWidget()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Center(
            child: Image(
              image: AssetImage("assets/logo.png"),
              width: 200.0,
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          decoration: new BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          padding: EdgeInsets.all(16),
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                cursorColor: Color(0xffb55e28),
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextField(
                cursorColor: Color(0xffb55e28),
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  color: Color(0xffb55e28),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color(0xffffd544), fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
