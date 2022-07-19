import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_2/exploration_screens/explore_categories.dart';
import 'explore_display_screens/display_broad.dart';
import 'explore_display_screens/display_detail.dart';
import 'explore_display_screens/display_major.dart';
import 'explore_display_screens/display_minor.dart';
import 'list_exploration_screens/explore_broad.dart';
import 'list_exploration_screens/explore_detail.dart';
import 'list_exploration_screens/explore_major.dart';
import 'list_exploration_screens/explore_minor.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.search_rounded),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: MySearchDelegate(),
                        );
                      },
                  ),
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
                              style: const TextStyle(
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

List<String>? getSearchResultsSuggestions() {
  List<String>? temp = [];
  for (var eachName in categoriesMajor) {
    temp.add(eachName.name);
  }
  for (var eachName in categoriesBroad) {
    temp.add(eachName.name);
  }
  for (var eachName in categoriesMinor) {
    temp.add(eachName.name);
  }
  for (var eachName in categoriesDetail) {
    temp.add(eachName.name);
  }
  return temp;
}

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

class MySearchDelegate extends SearchDelegate {
  late final List<String>? searchResults = getSearchResultsSuggestions();


  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back_rounded),
    onPressed: () {
      close(context, null);
    },
  );

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          else {
            query = "";
          }
        },
        icon: const Icon(Icons.clear),
    ),
  ];

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
    ),
  );
//gotoDisplayResult(context, query);
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String>? suggestions = searchResults?.where((searchResult) {
        final result = searchResult.toLowerCase();
        final input = query.toLowerCase();
        return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions?.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions![index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }


}