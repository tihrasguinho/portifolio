import 'package:camera/camera.dart';

class MainConfig {
  static final _instance = MainConfig._internal();

  late List<CameraDescription> _cameras;

  List<CameraDescription> get cameras => _cameras;

  MainConfig._internal();

  factory MainConfig(List<CameraDescription> data) {
    _instance._cameras = data;
    return _instance;
  }

  static MainConfig get i => _instance;
}
