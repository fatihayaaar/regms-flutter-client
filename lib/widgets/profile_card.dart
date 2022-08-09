import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class ProfileCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileCardState();
}

class _ProfileCardState extends State {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProfileHeader(),
        _buildProfileActions(),
        Container(
          margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              _buildNameAndSurname(),
              SizedBox(height: 5),
              _buildBio(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileFollowersText(text: "Followers", count: "9.2M"),
                  SizedBox(width: 15),
                  _buildProfileFollowersText(text: "Following", count: "1"),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }

  _buildProfileHeader() {
    return Image.asset(
      "assets/images/dump_2.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
      height: 100,
    );
  }

  _buildAvatar() {
    return Container(
      alignment: Alignment.centerLeft,
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "assets/images/dump_1.jpg",
        size: 35,
      ),
    );
  }

  _buildNameAndSurname() {
    return Text(
      "Fatih Ayar",
      style: kNameAndSurnameTextStyle,
    );
  }

  _buildBio() {
    return Text(
      "Software Developer ;) fayardev founder",
      style: kBioTextStyle,
    );
  }

  _buildProfileActions() {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.fromLTRB(0, 110, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildProfileEditButton("Edit", () {
            Route route =
                MaterialPageRoute(builder: (_) => EditProfileScreen());
            Navigator.push(context, route);
          }),
        ],
      ),
    );
  }

  _buildProfileEditButton(String text, void onClick()) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 33,
      child: ElevatedButton(
        style: kProfileButtonButtonStyle,
        onPressed: onClick,
        child: Text(
          text,
          style: kProfileButtonContentTextStyle,
        ),
      ),
    );
  }

  _buildProfileFollowersText({required String text, required String count}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          Text(
            count,
            style: kFollowersCountSizeTextStyle,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: kFollowersCountTextStyle,
          ),
        ],
      ),
    );
  }
}
