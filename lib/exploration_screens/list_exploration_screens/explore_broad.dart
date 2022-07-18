import 'package:flutter/material.dart';
import 'package:project_2/exploration_screens/category_card.dart';
import 'package:project_2/exploration_screens/explore_categories.dart';

import '../../api/api_links.dart';

class ExploreBroad extends StatefulWidget {
  const ExploreBroad({Key? key}) : super(key: key);

  @override
  State<ExploreBroad> createState() => _ExploreBroadState();
}

class _ExploreBroadState extends State<ExploreBroad> {
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
                          image: AssetImage("images/ux_design.png"),
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
                                    Text("Broad Group",
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(children: [
                                      Expanded(child: Column(
                                        children: [
                                          Text("Broad Group categories contain ${categoriesBroad.length} that comprises of the jobs of the world",
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
                      for (int i=0; i<categoriesBroad.length; i++)
                        CategoryCard(name: categoriesBroad[i].name, tag: "Broad Occupation Group", nav: ApiConstants.cateBroadInfo[i],)
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