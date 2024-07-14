import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: false,
      ),
      body: _myProfileBody(),
    );
  }

  _myProfileBody() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: context.width(),
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
              child: Row(
                children: [
                  _myAvatar(),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(LineIcons.linkedin),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _myAvatar() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 75,
          child: CircleAvatar(
            radius: 70,
            child: Container(
                child: Image.network("https://avatar.iran.liara.run/public")),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
