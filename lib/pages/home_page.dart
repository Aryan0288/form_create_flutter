import 'package:flutter/material.dart';
import 'package:form_page/providers/login_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: ListView.builder(
                itemCount: value.foodCatagoryData.length - 1,
                itemBuilder: (context, index) {
                  final item = value.foodCatagoryData[index + 1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item['strCategoryThumb'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180,
                          ).py(8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${item['strCategory']}".text.xl3.semiBold.make(),
                                RichText(
                                    text: TextSpan(
                                        text: item['strCategoryDescription']
                                            .substring(0, 50),
                                        style:
                                            const TextStyle(color: Colors.black,fontSize: 14),
                                        children: const [TextSpan(text: "...")]))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      );
    });
  }
}
