import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChangeImage extends StatefulWidget {
  const ChangeImage({super.key});

  @override
  State<ChangeImage> createState() {
    return _ChangeImage();
  }
}

class _ChangeImage extends State<ChangeImage> {
  File? _image; // Variabel untuk menyimpan gambar yang akan ditampilkan

  Future<void> changeImg(ImageSource source) async {
    try{
      final pickedImage = await ImagePicker().pickImage(source: source);

      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path); // Mengganti gambar yang ditampilkan dengan gambar yang dipilih
        });
      }else{
        print('tidak ada gambar yang dipilih');
      }
    }catch(error){
      print('terjadi kesalahan $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Tambahkan logika yang ingin Anda jalankan saat gambar ditekan di sini
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Ambil dari Galeri'),
                    onTap: () {
                      changeImg(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Ambil dari Kamera'),
                    onTap: () {
                      changeImg(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 70,
        backgroundImage: _image != null
            ? FileImage(_image!)
            : const AssetImage('assets/images/portoImage.jpg') as ImageProvider,
      ),
    );
  }
}
