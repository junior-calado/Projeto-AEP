
import '../models/threat.dart';

class ThreatService {
  // Simulating detection of threats without actual ML for web compatibility
  List<Threat> detectThreats() {
    return [
      Threat(
          id: '1',
          title: 'Suspicious Login Attempt',
          description: 'Detected an unusual login attempt from an unknown IP.',
          severity: 'High'),
      Threat(
          id: '2',
          title: 'Multiple Failed Logins',
          description: 'Detected multiple failed login attempts.',
          severity: 'Medium'),
      Threat(
          id: '3',
          title: 'Phishing Attempt Detected',
          description: 'Suspicious phishing attempt through email link.',
          severity: 'Critical')
    ];
  }

  // Simulating historical threats
  List<Threat> threatHistory() {
    return [
      Threat(id: '4', title: 'Old Threat', description: 'Previous threat detected.', severity: 'Low'),
      Threat(id: '5', title: 'Old Malware', description: 'Malware detected in email.', severity: 'Medium')
    ];
  }
}
