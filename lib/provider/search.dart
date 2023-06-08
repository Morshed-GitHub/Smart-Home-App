import 'package:flutter/cupertino.dart';
import 'package:smart_home_app/utils/constants.dart';
import '../boxes/boxes.dart';

class SearchProvider with ChangeNotifier {
  // Private Access Modifier
  late bool _isTapped;
  late String _selectedDevice;

  // Getter Methods
  bool get isTapped => _isTapped;
  String get selectedDevice => _selectedDevice;

  // Default Constructor
  SearchProvider() {
    _loadDataFromHive();
  }

  // Load/ retrived stored Search data from Hive
  Future<void> _loadDataFromHive() async {
    final searchMap = Boxes.get(key: SEARCH_KEY) ?? {};
    _isTapped = searchMap[SEARCH_isTapped] ??
        false; // Read the isTapped value from the box
    _selectedDevice = searchMap[SEARCH_selectedDevice] ??
        ''; // Read the selectedDevice value from the box
    notifyListeners();
  }

  // Toggle for updating switches
  Future<void> toggleSelection({required String title}) async {
    // If the tapped device is already selected, deselect it and
    // if a different device is tapped, select it
    _isTapped = (_selectedDevice != title);
    _selectedDevice = _isTapped ? title : '';

    _updateSearchDataToHive();
    notifyListeners();
  }

  // Update/override newest Search data to Hive
  Future<void> _updateSearchDataToHive() async {
    await Boxes.update(key: SEARCH_KEY, value: {
      SEARCH_isTapped: _isTapped,
      SEARCH_selectedDevice: _selectedDevice,
    });
  }
}
