import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                ),
                height: size.height * 0.2 - 27,
                decoration: BoxDecoration(color: Color(0xffce93d8),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  )
                ),
                child: Row(
                  children: [
                    Text(
                      "Discover jobs!",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Image.asset("images/profile_icon.png")
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,10),
                        blurRadius: 50,
                        color: Color(0xffce93d8).withOpacity(0.23),
                      ),
                    ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {

                        },
                        decoration: InputDecoration(
                          hintText: "        Search",
                          hintStyle: TextStyle(
                            color: Color(0xffce93d8).withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: const Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
                // decoration: BoxDecoration,
              ))
            ],
          ),
        )
      ],
    );
  }
}
