import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/app_colors.dart';



class ViewImageDialog extends StatelessWidget {
  final String image;
  final String gifImage;
  final String label;
  final String description;
  final bool showGif;
  Function(bool)? isDeleted;
  final VoidCallback? onYesPressed;
  final bool showButton;
  final double size;

  ViewImageDialog(
      {required this.image,
        required this.label,
        required this.description,
        required this.gifImage,
        required this.showGif,
        this.isDeleted,
        this.onYesPressed,
        this.showButton = false,
        this.size = 100
      }
      );

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear,color: AppColors.carrotRed,size: 25,))),

              Image.network(
                gifImage,
                width: 150,
                height: 150,
                fit: BoxFit.fill,
              ),


            ],
          ),
        ),
      ),
    );
  }
}