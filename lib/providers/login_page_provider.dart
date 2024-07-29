import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_page/providers/image_file_structure.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// https://www.themealdb.com/api/json/v1/1/filter.php?c=Miscellaneous
class LoginPageProvider extends ChangeNotifier {
  bool visible = true;

  List<dynamic> imagesData = [];

  var backImage =
      "https://miro.medium.com/v2/resize:fit:828/format:webp/1*hfVeZ7g_pPMQzPQa_LkdMw.jpeg";

  List<dynamic> foodCatagoryData = [];

  // constructor
  LoginPageProvider() {
    fetchData();
    fetchFoodApiCategoryData();
    notifyListeners();
  }

  void fetchData() async {
    var data = await rootBundle.loadString("assets/images/imagefile.json");
    var res = jsonDecode(data) as List;
    // print(res[0]);
    imagesData = res;

    notifyListeners();
  }

  void setBackImage(String s, int index) {
    backImage = s;
    imagesData[index]['onclickEffect']
        ? imagesData[index]['onclickEffect'] = false
        : imagesData[index]['onclickEffect'] = true;
    notifyListeners();
  }

  void setVisible() {
    visible ? visible = false : visible = true;
    notifyListeners();
  }

  void fetchFoodApiCategoryData() async {
    Uri url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    var response = await http.get(url);

    var data = jsonDecode(response.body);
    foodCatagoryData = data['categories'];
  }
}
