// home_screen.dart

import 'package:flutter/material.dart';
import '../services/threat_service.dart';
import '../models/threat.dart';
import 'threat_detail_screen.dart';
import 'threat_history_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final ThreatService _threatService = ThreatService();
  final Function(bool) onThemeToggle;

  HomeScreen({required this.onThemeToggle});

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
          ),
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              onThemeToggle(value);
            },
            activeColor: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: threats.length,
          itemBuilder: (context, index) {
            final threat = threats[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                leading: Icon(
                  Icons.security,
                  color: threat.severity == 'Critical'
                      ? Colors.red
                      : threat.severity == 'High'
                          ? Colors.orange
                          : Colors.blue,
                  size: 30,
                ),
                title: Text(
                  threat.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    threat.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                trailing: Text(
                  threat.severity,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
