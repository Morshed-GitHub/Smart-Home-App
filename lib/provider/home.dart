import 'package:flutter/cupertino.dart';
import 'package:smart_home_app/utils/constants.dart';
import '../boxes/boxes.dart';

class HomeProvider with ChangeNotifier {
  // Private Access Modifier
  late double _mainLightSliderVal;
  late double _floorLightSliderVal;
  late bool _isHumidiferToggled;
  late bool _isPurifierToggled;

  // Getter Methods
  double get mainLightSliderVal => _mainLightSliderVal;
  double get floorLightSliderVal => _floorLightSliderVal;
  bool get isHumidiferToggled => _isHumidiferToggled;
  bool get isPurifierToggled => _isPurifierToggled;

  // Default Constructor
  HomeProvider() {
    _loadDataFromHive();
  }

  // Load/ retrived stored Home data from Hive
  Future<void> _loadDataFromHive() async {
    final homeMap = Boxes.get(key: HOME_KEY) ?? {};
    _mainLightSliderVal = homeMap[HOME_mainLightSliderVal] ?? 0.0;
    _floorLightSliderVal = homeMap[HOME_floorLightSliderVal] ?? 0.0;
    _isHumidiferToggled = homeMap[HOME_isHumidiferToggled] ?? false;
    _isPurifierToggled = homeMap[HOME_isPurifierToggled] ?? false;
    notifyListeners();
  }

  // Update/override newest Home data to Hive
  Future<void> _updateHomeDataToHive() async {
    await Boxes.update(key: HOME_KEY, value: {
      HOME_mainLightSliderVal: _mainLightSliderVal,
      HOME_floorLightSliderVal: _floorLightSliderVal,
      HOME_isHumidiferToggled: _isHumidiferToggled,
      HOME_isPurifierToggled: _isPurifierToggled,
    });
  }

  // Setter methods for updating values
  void setMainLightSliderVal(double val) {
    _mainLightSliderVal = val;

    _updateHomeDataToHive();
    notifyListeners();
  }

  void setFloorLightSliderVal(double val) {
    _floorLightSliderVal = val;

    _updateHomeDataToHive();
    notifyListeners();
  }

  // Toggle methods for updating switches
  void toggleHumidiferSwitch() {
    _isHumidiferToggled = !_isHumidiferToggled;

    _updateHomeDataToHive();
    notifyListeners();
  }

  void togglePurifierSwitch() {
    _isPurifierToggled = !_isPurifierToggled;

    _updateHomeDataToHive();
    notifyListeners();
  }
}
