import 'package:flutter/material.dart';
import 'package:project_2/api/constants.dart';
import 'package:project_2/exploration_screens/explore_groups/explore_main_categories.dart';

import '../category_card.dart';

class ExploreDetail extends StatefulWidget {
  const ExploreDetail({Key? key}) : super(key: key);

  @override
  State<ExploreDetail> createState() => _ExploreDetailState();
}

class _ExploreDetailState extends State<ExploreDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: size.height * .35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/business.png"),
                          fit: BoxFit.fitWidth
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * .1,),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Detailed Group",
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(children: [
                                      Expanded(child: Column(
                                        children: [
                                          Text("Detailed Group categories contain ${categoriesDetail.length} major categories that comprises of the jobs of the world",
                                            maxLines: 5,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF8F8F8F),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                        ],
                                      ),
                                      ),
                                    ],
                                    )
                                  ],
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height*.4 - 50),
                  child: Column(
                    children: [
                      for (int i=0; i<categoriesDetail.length; i++)
                        CategoryCard(name: categoriesDetail[i].name, tag: "Detailed Occupation Group", nav: ApiConstants.cateDetailInfo[i],)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
