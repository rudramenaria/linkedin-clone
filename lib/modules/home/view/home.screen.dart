import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/common/style/style.dart';
import 'package:linkedin_clone/modules/home/controller/post.controller.dart';
import 'package:linkedin_clone/modules/home/model/post.model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.read<PostController>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PostModel> posts =
        context.select((PostController value) => value.post);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: _appBar(),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10.0),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.0,
        ),
        itemBuilder: (context, index) {
          return _postUi(posts[index]);
        },
        itemCount: posts.length,
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  _postUi(PostModel postData) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          20.height,
          _post1stPart(postData),
          _post2Part(),
          10.height,
          _post3Part(),
          15.height,
        ],
      ),
    );
  }

  _post3Part() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  LineIcons.thumbs_up,
                  color: AppColors.darkGrey,
                ),
                4.height,
                Text(
                  'Likes',
                  style: AppStyle.primary(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  LineIcons.comment_dots,
                  color: AppColors.darkGrey,
                ),
                4.height,
                Text(
                  'Comment',
                  style: AppStyle.primary(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  LineIcons.share,
                  color: AppColors.darkGrey,
                ),
                4.height,
                Text(
                  'Share',
                  style: AppStyle.primary(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  LineIcons.telegram,
                  color: AppColors.darkGrey,
                ),
                4.height,
                Text(
                  'Send',
                  style: AppStyle.primary(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  _post2Part() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(
        thickness: 2,
        color: Color(0xFFEBEBEB),
      ),
    );
  }

  _post1stPart(PostModel postData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                child: Image.network(postData.user.profileLink),
              ),
              20.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextWidget(
                    list: [
                      TextSpan(
                          text: postData.user.name,
                          style: AppStyle.primary(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: ' ◦ ' + postData.connection,
                              style: AppStyle.primary(
                                color: AppColors.darkGrey,
                                fontSize: 17,
                              ),
                            )
                          ]),
                    ],
                  ),
                  Text(
                    postData.user.occupation,
                    style: AppStyle.primary(
                        color: AppColors.darkGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  RichTextWidget(
                    list: [
                      TextSpan(
                          text: "${postData.createdAt.hour}h  ◦ ",
                          style: AppStyle.primary(
                              color: AppColors.darkGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                LineIcons.globe,
                                color: AppColors.darkGrey,
                              ),
                            )
                          ]),
                    ],
                  ),
                ],
              )
            ],
          ),
          10.height,
          ReadMoreText(
            postData.about,
            trimMode: TrimMode.Line,
            trimLines: 3,
            colorClickableText: AppColors.darkGrey,
            trimCollapsedText: ' Show more',
            trimExpandedText: ' Show less',
            style: AppStyle.primary(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          20.height,
          Row(
            children: [
              Icon(Icons.linked_camera_sharp),
              Text(
                postData.likes.toString(),
                style: AppStyle.primary(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                "${postData.comments.toString()} comments",
                style: AppStyle.primary(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "Account",
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 21,
            child: Container(
                child: Image.network("https://avatar.iran.liara.run/public")),
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
          Icon(
            Icons.chat_bubble,
            color: AppColors.darkGrey,
          ),
        ],
      ),
    );
  }
}
