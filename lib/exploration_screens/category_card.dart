import 'package:flutter/material.dart';

import 'explore_display_screens/display_broad.dart';
import 'explore_display_screens/display_detail.dart';
import 'explore_display_screens/display_major.dart';
import 'explore_display_screens/display_minor.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String tag;
  final List<String> nav;
  // final String category;
  const CategoryCard({
    Key? key,
    required this.name,
    required this.tag,
    required this.nav,
    // required this.category,
  }) : super(key: key);

  Widget getDisplayCate(String name, String tag, List<String> nav) {
    if (tag == "Major Occupation Group") { // tag == category
      return DisplayMajor(title: name, category: tag, nav: nav,);
    }
    else if (tag == "Broad Occupation Group") {
      return DisplayBroad(title: name, category: tag, nav: nav,);
    }
    else if (tag == "Minor Occupation Group") {
      return DisplayMinor(title: name, category: tag, nav: nav,);
    }
    else {
      return DisplayDetail(title: name, category: tag, nav: nav,);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // maybe make condition IF BROAD, DETAIL, MINOR, MAJOR then display_diff screen since
        // seems like each category has different ways to calling APIs
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => getDisplayCate(name, tag, nav)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: EdgeInsets.only(bottom: 16),
        width: size.width-48,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(38.5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0,10),
                  blurRadius: 33,
                  color: Color(0xFFD3D3D3).withOpacity(.84)
              )
            ]
        ),
        child: Row(
          children: [
            // Flexible(
              RichText(
                // maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: (name.length > 28 ? name.substring(0,27)+"..." : name),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF393939),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text: "\n$tag",
                            style: TextStyle(
                              color: Color(0xFF8F8F8F),
                            )
                        )
                      ]
                  )
              ),
            // ),
            Spacer(),
            IconButton(
                onPressed: null,
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 18,),
            ),
          ],
        ),
      ),
    );
  }
}
