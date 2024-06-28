import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/common/style/style.dart';
import 'package:nb_utils/nb_utils.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  State<MessagesListScreen> createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "Messaging",
        style: AppStyle.primary(
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => MessagesListScreen(),
            //   ),
            // );
          },
          icon: const Icon(Icons.more_vert_sharp),
          color: AppColors.darkGrey,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => MessagesListScreen(),
            //   ),
            // );
          },
          icon: const Icon(Icons.edit_square),
          color: AppColors.darkGrey,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(42),
        child: Column(
          children: [
            Divider(
              color: AppColors.grey.withOpacity(0.4),
              thickness: 2.0,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: EdgeInsets.zero,
                  constraints: BoxConstraints(maxHeight: 40.0),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(LineIcons.sort),
                  hintText: "Search",
                ),
              ),
            ),
            Divider(
              color: AppColors.grey.withOpacity(0.4),
              thickness: 2.0,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
