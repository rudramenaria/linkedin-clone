import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkedin_clone/common/assets/colors.dart';
import 'package:linkedin_clone/modules/home/controller/post.controller.dart';
import 'package:linkedin_clone/modules/home/model/post.model.dart';
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
      appBar: _appBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 10.0,
        ),
        itemBuilder: (context, index) {
          return Text(posts[index].user.name);
        },
        itemCount: posts.length,
      ),
      bottomNavigationBar: _bottomBar(),
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
