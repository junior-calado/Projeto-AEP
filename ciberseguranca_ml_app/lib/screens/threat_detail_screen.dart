
import 'package:flutter/material.dart';
import '../models/threat.dart';

class ThreatDetailScreen extends StatelessWidget {
  final Threat threat;

  ThreatDetailScreen({required this.threat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(threat.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(threat.description),
            SizedBox(height: 10),
            Text('Severity:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(threat.severity, style: TextStyle(color: threat.severity == 'Critical' ? Colors.red : Colors.orange)),
          ],
        ),
      ),
    );
  }
}
