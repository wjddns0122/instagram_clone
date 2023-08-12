import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/src/controller/upload_controller.dart';
import 'package:instagram/src/widget/image_data.dart';
import 'package:instagram/src/widget/upload_image.dart';

class Upload extends GetView<UploadController> {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
            onTap: Get.back,
            child: ImageData(
              path: ImagePath.closeImage,
            ),
          ),
        ),
        title: const Text(
          '세 개시물',
        ),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(path: ImagePath.nextImage),
          )
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            _preview(),
            _header(),
            _images(),
          ],
        ),
      ),
    );
  }

  Widget _preview() {
    return Container(
      width: Get.width,
      height: Get.width,
      color: Colors.black,
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              (controller.albums.isEmpty)
                  ? Container()
                  : GestureDetector(
                      onTap: controller.changeAlbum,
                      child: Text(
                        controller.albums[0].name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
              ImageData(
                path: ImagePath.downArrow,
                width: 60,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF808080)),
                child: ImageData(path: ImagePath.imageSelectIcon)),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF808080),
              ),
              child: ImageData(path: ImagePath.cameraIcon),
            )
          ],
        )
      ],
    );
  }

  Widget _images() {
    return (controller.albums.isEmpty)
        ? Container()
        : Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0),
                itemCount: controller.albums[controller.index].images!.length,
                itemBuilder: (context, index) {
                  final image =
                      controller.albums[controller.index].images![index];
                  return UploadImage(entity: image, fit: BoxFit.cover);
                }),
          );
  }
}
