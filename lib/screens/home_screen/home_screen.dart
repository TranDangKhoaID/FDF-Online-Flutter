import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_online/common/share_color.dart';
import 'package:pdf_online/controllers/home_controller.dart';
import 'package:pdf_online/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// MARK: - Initials;
  final _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Online'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (_controller.isLoading.value) {
            return LoadingWidget();
          }
          return GridView.builder(
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
            ),
            itemCount: _controller.folders.length,
            itemBuilder: (context, index) {
              final folder = _controller.folders[index];
              return Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ShareColors.kPrimaryColor.withOpacity(0.8),
                      Colors.grey,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  folder.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
              //return Text(pdf.name);
            },
          );
        },
      ),
    );
  }
}
