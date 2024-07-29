import 'package:flutter/material.dart';
import 'package:form_page/pages/home_page.dart';
import 'package:form_page/pages/signup_page.dart';
import 'package:form_page/providers/login_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';

class BackgroundImages extends StatefulWidget {
  const BackgroundImages({super.key});

  @override
  State<BackgroundImages> createState() => _BackgroundImagesState();
}

class _BackgroundImagesState extends State<BackgroundImages> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.imagesData.length,
          itemBuilder: (context, index) {
            final item = value.imagesData[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  value.setBackImage(item['image'],index);
                },
                child: CircleAvatar(
                  radius: item['onclickEffect'] ? 46 : 43,
                  backgroundImage: NetworkImage(item['image']),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
