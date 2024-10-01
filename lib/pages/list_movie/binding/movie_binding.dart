import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../../controller/movie.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController());
  }
}
