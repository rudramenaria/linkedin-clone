import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkedin_clone/common/assets/assets.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/common/style/style.dart';
import 'package:linkedin_clone/common/widgets/appbar.dart';
import 'package:linkedin_clone/modules/home/controller/post.controller.dart';
import 'package:linkedin_clone/modules/home/model/post.model.dart';
import 'package:linkedin_clone/modules/messages/view/message-list.screen.dart';
import 'package:linkedin_clone/modules/my%20networks/view/my-networks.screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _sKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.read<PostController>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      backgroundColor: AppColors.bgColor,
      drawer: _drawer(),
      appBar: _appBar(),
      body: _postScreen(),
    );
  }

  _postScreen() {
    List<PostModel> posts =
        context.select((PostController value) => value.post);
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10.0),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10.0,
      ),
      itemBuilder: (context, index) {
        return _postUi(posts[index]);
      },
      itemCount: posts.length,
    );
  }

  _drawer() {
    return Drawer(
      width: context.width() * 0.87,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 204,
                color: AppColors.lightBg,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 32),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: ClipRRect(
                              borderRadius: radius(50),
                              child: Image.network(
                                'https://i.pinimg.com/550x/c3/b5/c5/c3b5c5920634a9267ca6244b980f801f.jpg',
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                          ),
                          20.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yuri Dud',
                                style: AppStyle.primary(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'View Profile',
                                    style: AppStyle.primary(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightBlue),
                                  ),
                                  10.width,
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                  ),
                                  10.width,
                                  Text(
                                    'Settings',
                                    style: AppStyle.primary(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightBlue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: AppColors.lightGrey,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 25),
                      child: Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            child: const Placeholder(),
                          ),
                          18.width,
                          Text(
                            'Access My Premium',
                            style: AppStyle.primary(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
                child: Row(
                  children: [
                    Text(
                      'Recent',
                      style: AppStyle.primary(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 20),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Icon(LineIcons.users),
                    ),
                    18.width,
                    Text(
                      'Premium Career Group',
                      style: AppStyle.primary(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 30),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Icon(LineIcons.users),
                    ),
                    18.width,
                    Text(
                      'Jobs in Belarus',
                      style: AppStyle.primary(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: AppColors.lightGrey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
                child: Row(
                  children: [
                    Text(
                      'Groups',
                      style: AppStyle.primary(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightBlue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 20),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Icon(LineIcons.users),
                    ),
                    18.width,
                    Text(
                      'Premium Career Group',
                      style: AppStyle.primary(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 30),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Icon(LineIcons.users),
                    ),
                    18.width,
                    Text(
                      'Jobs in Belarus',
                      style: AppStyle.primary(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: AppColors.lightGrey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
                child: Row(
                  children: [
                    Text(
                      'Events',
                      style: AppStyle.primary(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightBlue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 20),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Icon(Icons.add),
                    ),
                    18.width,
                    Text(
                      'Create Event',
                      style: AppStyle.primary(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: AppColors.lightGrey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
                child: Row(
                  children: [
                    Text(
                      'Followed Hashtags',
                      style: AppStyle.primary(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightBlue),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: AppColors.lightGrey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
                child: Row(
                  children: [
                    Text(
                      'Dickover more',
                      style: AppStyle.primary(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _postUi(PostModel postData) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              20.height,
              _post1stPart(postData),
              _post2Part(),
              10.height,
              _post3Part(),
              15.height,
            ],
          ),
          Positioned(
            top: 10,
            right: 15,
            child: Icon(Icons.more_vert),
          )
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

  _postImage() {
    return Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZIK_dzjnmoFopN-Tti8pDSgDA3R8NvHYnAg&s',
      fit: BoxFit.cover,
      width: context.width(),
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
          _postImage(),
          10.height,
          Row(
            children: [
              Image.asset(AppAssets.likes),
              Image.asset(AppAssets.bulb),
              Image.asset(AppAssets.clap),
              Text(
                ' ' + postData.likes.toString(),
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

  _appBar() {
    return CustomAppBar.getAppBar(_sKey, context);
  }
}
