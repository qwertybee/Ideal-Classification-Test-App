import 'package:flutter/material.dart';
import 'package:project_2/exploration_screens/category_card.dart';
import 'package:project_2/exploration_screens/explore_groups/explore_main_categories.dart';

import '../../api/constants.dart';

class ExploreMinor extends StatefulWidget {
  const ExploreMinor({Key? key}) : super(key: key);

  @override
  State<ExploreMinor> createState() => _ExploreMinorState();
}

class _ExploreMinorState extends State<ExploreMinor> {
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
                          image: AssetImage("images/photography.png"),
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
                                    Text("Minor Group",
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(children: [
                                      Expanded(child: Column(
                                        children: [
                                          Text("Minor Group categories contain ${categoriesMinor.length} that comprises of the jobs of the world",
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
                      for (int i=0; i<categoriesMinor.length; i++)
                        CategoryCard(name: categoriesMinor[i].name, tag: "Minor Occupation Group", nav: ApiConstants.cateMinorInfo[i],)
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