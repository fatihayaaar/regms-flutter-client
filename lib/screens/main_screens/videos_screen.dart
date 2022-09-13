import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_transparent.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/cards/video_full_screen_card.dart';

class VideosScreen extends StatefulWidget {
  static const routeName = '/videos';

  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State {
  var posts = [];

  @override
  Widget build(BuildContext context) {
    posts = [
      VideoFullScreenCard(
        post: Post(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          likeCount: 920,
          commentCount: 10,
          text:
              "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
          sendDate: "3s",
          media: "assets/videos/dump_video_1.mp4",
        ),
      ),
      VideoFullScreenCard(
        post: Post(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          likeCount: 920,
          commentCount: 0,
          sendDate: "3s",
          media: "assets/videos/dump_video_2.mp4",
        ),
      ),
      VideoFullScreenCard(
        post: Post(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          likeCount: 9220,
          commentCount: 0,
          text:
              "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
          sendDate: "3s",
          media: "assets/videos/dump_video_1.mp4",
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBarTransparent(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildBody() {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return posts[index];
          },
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildHeaderBar(),
        ),
      ],
    );
  }

  _buildHeaderBar() {
    return Container(
      height: 45,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _buildTitle("Videos"),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _buildAddAction(),
          ),
        ],
      ),
    );
  }

  _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: tAppbarTitleTextStyle,
      ),
    );
  }

  _buildAddAction() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Icon(
        Icons.add_circle_outline_sharp,
        color: Colors.white,
      ),
    );
  }
}
