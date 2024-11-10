import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/ml_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MLService _mlService;

  @override
  void initState() {
    super.initState();
    _mlService = Provider.of<MLService>(context, listen: false);
    _mlService.loadModel();
  }

  @override
  void dispose() {
    _mlService.close();
    super.dispose();
  }

  void detectThreat() {
    List<double> inputData = [/* Dados simulados de entrada para análise */];
    List<double> output = _mlService.predict(inputData);
    print("Resultado da Previsão: ${output}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detecção de Ameaças')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Analise as atividades de rede.'),
            ElevatedButton(
              onPressed: detectThreat,
              child: Text('Detectar Ameaça'),
            ),
          ],
        ),
      ),
    );
  }
}
