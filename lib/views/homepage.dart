import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_fetchapi/controllers/product_controller.dart';
import 'package:getx_fetchapi/views/product_title.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GetX_demo'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('ShopX'),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.view_list_rounded)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_view),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => StaggeredGridView.countBuilder(
                  itemCount: productController.productList.length,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                ),
              ),
              // child: Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: StaggeredGridView.countBuilder(
              //     // itemCount: productController.productList.length,
              //     itemCount: 10,
              //     mainAxisSpacing: 16,
              //     crossAxisSpacing: 16,
              //     crossAxisCount: 2,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 175,
              //         width: 100,
              //         color: Colors.grey,
              //       );
              //     },
              //     staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
