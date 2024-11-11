
import 'package:flutter/material.dart';
import '../services/threat_service.dart';
import '../models/threat.dart';
import 'threat_detail_screen.dart';
import 'threat_history_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final ThreatService _threatService = ThreatService();

  @override
  Widget build(BuildContext context) {
    List<Threat> threats = _threatService.detectThreats();

    return Scaffold(
      appBar: AppBar(
        title: Text('Threat Detection Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ThreatHistoryScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: threats.length,
        itemBuilder: (context, index) {
          final threat = threats[index];
          return Card(
            child: ListTile(
              title: Text(threat.title),
              subtitle: Text(threat.description),
              trailing: Text(
                threat.severity,
                style: TextStyle(
                  color: threat.severity == 'Critical'
                      ? Colors.red
                      : threat.severity == 'High'
                          ? Colors.orange
                          : Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThreatDetailScreen(threat: threat)));
              },
            ),
          );
        },
      ),
    );
  }
}
