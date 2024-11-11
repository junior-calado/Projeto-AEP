
import 'package:flutter/material.dart';
import '../services/threat_service.dart';
import '../models/threat.dart';

class ThreatHistoryScreen extends StatelessWidget {
  final ThreatService _threatService = ThreatService();

  @override
  Widget build(BuildContext context) {
    List<Threat> history = _threatService.threatHistory();

    return Scaffold(
      appBar: AppBar(title: Text('Threat History')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final threat = history[index];
          return ListTile(
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
          );
        },
      ),
    );
  }
}
