import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userName = 'User';


  void getUserName() async {
    String? currentUserName = await _auth.currentUser?.displayName;
    if (currentUserName != null) {
      userName = currentUserName;
    } else {
      userName = 'User';
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserName();
    var catNav = [
      const ExploreMajor(),
      const ExploreBroad(),
      const ExploreMinor(),
      const ExploreDetail(),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, top: 50, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 27),
            Text("Hey $userName, ",
              style: const TextStyle(
                fontSize: 28, color: Color(0xFF0D1333), fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Discover more jobs",
              style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF61688B),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: const [
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
              children: const [
                Text("Category",
                  style: TextStyle(
                    fontSize: 21, color: Color(0xFF0D1333), fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                // padding: EdgeInsets.all(10),
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
