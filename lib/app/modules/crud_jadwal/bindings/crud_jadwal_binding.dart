import 'package:get/get.dart';

import '../controllers/crud_jadwal_controller.dart';

class CrudJadwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrudJadwalController>(
      () => CrudJadwalController(),
    );
  }
}
