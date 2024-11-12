import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  //
  final supabase = Supabase.instance.client;
  RxList<FileObject> folders = <FileObject>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    try {
      final response = await supabase.storage.from('pdf').list();
      if (response.isEmpty) {
        print('get catgegoris trỗng');
        return;
      }
      folders.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Lỗi get catgegoris: $e');
      //return;
    }
  }
}
