import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account preferences'),
            subtitle: Text(
                'Options for managing your account and experience on LinkedIn'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Sign in & security '),
            subtitle: Text(
                'Options and controls for signing in and keeping your account safe'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text('Visibility'),
            subtitle: Text(
                'Control who sees yuor activity and information jn LinkedIn'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Communications'),
            subtitle: Text('Controls for emails, invites, and notification'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Data privacy'),
            subtitle: Text(
                'Control how LinkedIn uses your information for general site use and job seeking'),
          ),
        ],
      ),
    );
  }
}
