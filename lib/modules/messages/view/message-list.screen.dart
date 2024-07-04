import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/assets/assets.dart';
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
      body: ListView.separated(
          itemBuilder: (context, i) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: ClipRRect(
                      borderRadius: radius(64),
                      child: Image.network(
                        'https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_.jpg',
                        fit: BoxFit.cover,
                        width: 64,
                      ),
                    ),
                  ),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stuart Arnold',
                        style: AppStyle.primary(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        'Of course send your mail',
                        style: AppStyle.primary(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '10:07 AM',
                        style: AppStyle.primary(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                        width: 16.0,
                        child: Badge(
                          backgroundColor: Color(0xFF0A66C2),
                          label: Text(
                            '1',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.lightGrey,
              thickness: 2,
            );
          },
          itemCount: 10),
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
          onPressed: () {},
          icon: const Icon(Icons.more_vert_sharp),
          color: AppColors.darkGrey,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {},
          icon: Image.asset(AppAssets.edit),
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
                  suffixIcon: Image.asset(AppAssets.filter),
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
