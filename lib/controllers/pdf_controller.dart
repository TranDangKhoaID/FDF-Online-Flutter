import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PdfController extends GetxController {
  final supabase = Supabase.instance.client;
  RxList<FileObject> pdfs = <FileObject>[].obs;
  var isLoading = true.obs;

  Future<void> getAllPDF({
    required folderName,
  }) async {
    try {
      final response = await supabase.storage.from('pdf').list(
            path: folderName,
          );
      if (response.isEmpty) {
        print('get pdf trỗng');
        return;
      }
      pdfs.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Lỗi get pdf: $e');
      //return;
    }
  }
}
