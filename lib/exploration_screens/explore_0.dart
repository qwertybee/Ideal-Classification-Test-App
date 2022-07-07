import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                      image: AssetImage("images/marketing.png"),
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
                                    Text("Major Group",
                                        style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                    Text("Influence",
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(children: [
                                      Expanded(child: Column(
                                        children: [
                                          Text("Major Group categories contain 17 major categories that comprises of the jobs of the world",
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
                      Container(
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
                            RichText(
                              text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Chapter 1 : Money\n",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF393939),
                                      fontWeight: FontWeight.bold,
                                    ),
                                ),
                                TextSpan(
                                  text: "Information about this is placed here",
                                  style: TextStyle(
                                    color: Color(0xFF8F8F8F),
                                  )
                                )
                              ]
                            )
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: null,
                                icon: Icon(Icons.arrow_forward_ios_rounded, size: 18,)
                            )
                          ],
                        ),
                      )
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
