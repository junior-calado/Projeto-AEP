import 'package:tflite_flutter/tflite_flutter.dart';

class MLService {
  late Interpreter _interpreter;

  // Carregar o modelo de ML
  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('models/network_detection.tflite');
  }

  // Fazer a previsão com base nos dados de entrada
  List<double> predict(List<double> inputData) {
    var output = List.filled(1, 0.0).reshape([1, 1]);
    _interpreter.run(inputData, output);
    return output[0];
  }

  // Fechar o interpretador ao finalizar
  void close() {
    _interpreter.close();
  }
}
