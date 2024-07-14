import 'package:flutter/material.dart';

class ManageMyNetworkScreen extends StatefulWidget {
  const ManageMyNetworkScreen({super.key});

  @override
  State<ManageMyNetworkScreen> createState() => _ManageMyNetworkScreenState();
}

class _ManageMyNetworkScreenState extends State<ManageMyNetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage My Network'),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Connections'),
            trailing: Text('192'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_pin_circle_sharp),
            title: Text('People I follow'),
            trailing: Text('122'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home_work_rounded),
            title: Text('Companies'),
            trailing: Text('2o'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people_rounded),
            title: Text('Groups'),
            trailing: Text('10'),
          ),
        ],
      ),
    );
  }
}
