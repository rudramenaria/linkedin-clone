import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/common/style/style.dart';
import 'package:linkedin_clone/common/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _sKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar.getAppBar(_sKey, context),
      body: _notificationBody(),
    );
  }

  _notificationBody() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.blue,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  10.width,
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightBlue),
                  ),
                  10.width,
                  CircleAvatar(
                    radius: 32,
                    child: Image.network(
                      "https://avatar.iran.liara.run/public",
                    ),
                  ),
                  10.width,
                  _centerChildData(),
                  10.width,
                  Column(
                    children: [Text('1min'), Icon(Icons.more_vert_outlined)],
                  ),
                  15.width,
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 2,
            color: AppColors.grey,
          );
        },
        itemCount: 10);
  }

  Expanded _centerChildData() {
    return Expanded(
      child: Column(
        children: [
          RichTextWidget(list: [
            TextSpan(
                text: 'Nataliia Shostak',
                style: AppStyle.primary(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black)),
            TextSpan(
                text: ' and 2,486 others reacted to yuor post',
                style: AppStyle.primary(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.black))
          ]),
          10.height,
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'This is very wonderful news, I\'m looking forward to November ...',
                  style: AppStyle.primary(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'In November, we are launching an internship program for UI/UX designers with ...',
                  style: AppStyle.primary(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black)),
            ),
          ),
          10.height,
          Row(
            children: [
              Text('2,487 Reactions · 275 Comments',
                  style: AppStyle.primary(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black)),
            ],
          ),
          30.height,
        ],
      ),
    );
  }
}
