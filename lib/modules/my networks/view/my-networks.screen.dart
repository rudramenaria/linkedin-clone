import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/common/style/style.dart';
import 'package:linkedin_clone/common/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

class MyNetworksScreen extends StatefulWidget {
  const MyNetworksScreen({super.key});

  @override
  State<MyNetworksScreen> createState() => _MyNetworksScreenState();
}

class _MyNetworksScreenState extends State<MyNetworksScreen> {
  final _sKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar.getAppBar(_sKey, context),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'Manage my network',
              style: AppStyle.primary(
                  color: AppColors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
          10.height,
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'Invitation',
              style: AppStyle.primary(
                  color: AppColors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
          10.height,
          _peopleYouMayKnow(),
        ],
      ),
    );
  }

  _peopleYouMayKnow() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Text(
                'People you may know from Lomonosov Moscow State University',
                style: AppStyle.primary(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              10.height,
              Expanded(
                  child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.50,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                  decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: AppColors.grey),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                      ),
                      20.height,
                      Text(
                        "Veronica Symothomas",
                        style: AppStyle.primary(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      5.height,
                      Text(
                        "Junior Salesforce Developer - VRP C",
                        style: AppStyle.primary(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkGrey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      16.height,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                          ),
                          10.width,
                          Expanded(
                            child: Text(
                              "Lomonosov Moscow State hello",
                              style: AppStyle.primary(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: AppColors.darkGrey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      20.height,
                      OutlinedButton(onPressed: () {}, child: Text("Connect")),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
