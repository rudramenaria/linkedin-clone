import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/modules/messages/view/message-list.screen.dart';

class CustomAppBar {
  static getAppBar(GlobalKey<ScaffoldState> sKey, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              sKey.currentState?.openDrawer();
            },
            child: CircleAvatar(
              radius: 21,
              child: Container(
                  child: Image.network("https://avatar.iran.liara.run/public")),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  fillColor: AppColors.blue,
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  constraints: BoxConstraints(maxHeight: 40.0),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.qr_code),
                  hintText: "Search",
                ),
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => MessagesListScreen(),
                ),
              );
            },
            icon: const Icon(Icons.chat_bubble),
            color: AppColors.darkGrey,
          ),
        ],
      ),
    );
  }
}
