import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String tag;
  const CategoryCard({
    Key? key,
    required this.name,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: null,
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
