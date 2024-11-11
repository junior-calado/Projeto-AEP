
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notification Settings', style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: true,
              onChanged: (bool value) {},
            ),
            SizedBox(height: 10),
            Text('Security Settings', style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text('Enable Advanced Detection'),
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
