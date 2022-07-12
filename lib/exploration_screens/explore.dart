import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_2/exploration_screens/explore_groups/explore_main_categories.dart';
import 'package:project_2/exploration_screens/explore_screens/explore_detail.dart';
import 'explore_screens/explore_broad.dart';
import 'explore_screens/explore_major.dart';
import 'explore_screens/explore_minor.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    var catNav = [
      const ExploreMajor(),
      const ExploreBroad(),
      const ExploreMinor(),
      const ExploreDetail(),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SizedBox(height: 30),
            const Text("Hey User, ",
              style: TextStyle(
                fontSize: 28, color: Color(0xFF0D1333), fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Discover more jobs",
              style: TextStyle(
                fontSize: 24, color: Color(0xFF61688B),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Text("Search",
                    style: TextStyle(
                      fontSize: 18, color: Color(0xFFA0A5BD)
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",
                  style: TextStyle(
                    fontSize: 20, color: Color(0xFF0D1333), fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(10),
                      crossAxisCount: 2,
                      itemCount: categories.length,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => catNav[index]));
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: index.isEven ? 200 : 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                image: AssetImage(categories[index].nav),
                                fit: BoxFit.fill
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categories[index].name,
                                  style: TextStyle(
                                    fontSize: 20, color: Color(0xFF0D1333), fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('${categories[index].tag} Groups',
                                style: TextStyle(
                                  color: Color(0xFF0D1333).withOpacity(0.5)
                                ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1))
              ),
          ],
        ),
      ),
    );
  }
}
