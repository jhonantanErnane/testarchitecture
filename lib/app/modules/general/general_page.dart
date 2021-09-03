import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/page_names.dart';
import '../../shared/delegates/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import '../../shared/widgets/btn_rounded_with_back_widget.dart';
import '../../shared/widgets/container_default_widget.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage();

  @override
  GeneralPageState createState() => GeneralPageState();
}

class GeneralPageState extends State<GeneralPage> {
  static const List<ItemDefaultPage> list = [
    ItemDefaultPage(
      image: Icons.flutter_dash,
      path: PageNames.demo1,
      text: 'Page 1',
    ),
    ItemDefaultPage(
      image: Icons.flutter_dash,
      path: PageNames.demo2,
      text: 'Page 2',
    ),
    ItemDefaultPage(
      image: Icons.flutter_dash,
      path: PageNames.demo3,
      text: 'Page 3',
    ),
    ItemDefaultPage(
      image: Icons.flutter_dash,
      path: PageNames.demo4,
      text: 'Page 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContainerDefaultWidget(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Titulo \n\n',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Descrição do app de demonstração',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 8,
                          height: 100),
                  shrinkWrap: true,
                  itemCount: list.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext _, int index) {
                    return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () => Modular.to.pushNamed(list[index].path),
                        child: containerWithRoundedBorders(
                          list[index].image,
                          list[index].text,
                        ));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                BtnRoundedWithBackWidget(
                  arrowIsBack: false,
                  text: 'login',
                  onTap: () {
                    Modular.to
                        .pushNamed(PageNames.getPath(paths: [PageNames.auth]));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerWithRoundedBorders(IconData image, String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            ClipRRect(
              child: Icon(
                image,
                size: 35,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.visible,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemDefaultPage {
  final String text;
  final String path;
  final IconData image;

  const ItemDefaultPage(
      {required this.text, required this.path, required this.image});
}
