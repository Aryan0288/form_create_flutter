import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_page/providers/image_file_structure.dart';
import 'package:provider/provider.dart';

class LoginPageProvider extends ChangeNotifier {
  bool visible = true;
  List<dynamic> imagesData = [];
  var backImage =
      "https://miro.medium.com/v2/resize:fit:828/format:webp/1*hfVeZ7g_pPMQzPQa_LkdMw.jpeg";
  LoginPageProvider() {
    fetchData();
    notifyListeners();
  }

  void fetchData() async {
    var data = await rootBundle.loadString("assets/images/imagefile.json");
    var res = jsonDecode(data) as List;
    // print(res[0]);
    imagesData = res;

    notifyListeners();
  }

  void setBackImage(String s) {
    backImage = s;
    notifyListeners();
  }

  void setVisible() {
    visible ? visible = false : visible = true;
    notifyListeners();
  }
}
