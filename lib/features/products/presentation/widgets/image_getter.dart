import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGetter extends StatelessWidget {
  const ImageGetter({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePicker pick = ImagePicker();

    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await pick.pickImage(source: ImageSource.gallery);
                  },
                  child: const Text('Galeria')),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 226, 223, 223))),
                  onPressed: () async {
                    await pick.pickImage(source: ImageSource.camera);
                  },
                  child: const Text('Camera')),
            ],
          );
        });
  }
}
