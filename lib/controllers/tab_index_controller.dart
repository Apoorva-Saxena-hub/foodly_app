import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class TabIndexController extends GetxController {
  RxInt _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  void setTabIndex(int newValue) {
    _tabIndex.value = newValue;
  }
}
