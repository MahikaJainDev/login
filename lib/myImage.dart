import 'package:flutter/material.dart';
import 'package:login_app/providers/ImageProvider.dart';
import 'package:provider/provider.dart';

import 'imagePicker.dart';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyImageProvider>(
      create: (context) => MyImageProvider(),
      child: Consumer<MyImageProvider>(
        builder: (providerContext, provider, child) {
          if(provider.image==null)
            return GestureDetector(
              onTap: (){
                print('clicked');
                showImagePickerDialog(
                  context,
                  imageFile: provider.image,
                  onChange: (file) {
                    Navigator.of(context).pop();
                    provider.setImage(file);
                  }
                );
              },
              child: Icon(
                Icons.person_pin,
                size: 100,
                color: Color(0xff999999),
              ),
            );

          return Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black45,
                width: 3,
              ),
              image: DecorationImage(
                image: FileImage(provider.image),
              ),
            ),
            //  child: Image.file(provider.image),
          );
        },
      ),
    );
  }
}
