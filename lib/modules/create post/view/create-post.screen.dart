import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/common/style/style.dart';
import 'package:nb_utils/nb_utils.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _sKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        centerTitle: false,
        title: Text(
          'Share Post',
          style: AppStyle.primary(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Text(
            'Post',
            style: AppStyle.primary(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey),
          ),
          20.width,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _createPostBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  child: const Icon(Icons.link),
                  onPressed: () {
                    _showBottomSheet();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showBottomSheet() {
    _sKey.currentState?.showBottomSheet(
      (context) {
        return DraggableScrollableSheet(builder: (c, controller) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  10.height,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 4,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: radius(20),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.video_call),
                    title: Text('Video'),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.celebration),
                    title: Text('Celebrate an occasion'),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.edit_document),
                    title: Text('Add a document'),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.business_center_rounded),
                    title: Text('Share that you’re hiring'),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.contact_page_sharp),
                    title: Text('Find an expert'),
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.poll),
                    title: Text('Create a poll'),
                  ),
                ],
              ),
            ),
          );
        });
      },
      backgroundColor: Colors.transparent,
    );
  }

  _createPostBody() {
    return Column(
      children: [
        20.height,
        Row(
          children: [
            20.width,
            CircleAvatar(
              radius: 28,
              child: Container(
                  child: Image.network("https://avatar.iran.liara.run/public")),
            ),
            10.width,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yuri Dud',
                  style: AppStyle.primary(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.height,
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColors.darkGrey)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: [
                        const Icon(
                          LineIcons.globe,
                          size: 16,
                        ),
                        10.width,
                        DropdownButton(
                          isDense: true,
                          value: 'Anyone',
                          underline: const SizedBox.shrink(),
                          items: const [
                            DropdownMenuItem(
                              child: Text('Anyone'),
                              value: 'Anyone',
                            ),
                            DropdownMenuItem(
                              child: Text('Connection Only'),
                              value: 'Connection Only',
                            ),
                            DropdownMenuItem(
                              child: Text('Group'),
                              value: 'Group',
                            ),
                          ],
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Expanded(
          child: AppTextField(
            textFieldType: TextFieldType.OTHER,
            maxLines: 10,
            minLines: 10,
            autoFocus: true,
            textStyle:
                AppStyle.primary(fontSize: 24, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                hintText: 'What do you want to talk about?',
                contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
                hintStyle:
                    AppStyle.primary(fontSize: 24, fontWeight: FontWeight.w400),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
