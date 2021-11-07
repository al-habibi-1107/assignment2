import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routename = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(5),
                width: device.width,
                child: Column(
                  children: [
                    //TOP PART
                    Row(
                      children: [
                        // LEFT BUTTONS
                        Column(
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              size: 40,
                            ),
                            Text("1"),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 40,
                            ),
                            Text(
                              "Votes",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 100,
                          width: 70,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // DETAILS

                        Container(
                          height: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bond 25",
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Genre: ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "Action,Adventure,Thriller",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Director: ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "Cary Joji Fukanaga",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Starring: ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "Rami Malek, Leonao...",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                'Mins | English | 1 Apr',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '137 views| Voted by 3 people',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    // BUTTON
                    InkWell(
                      child: Container(
                        height: 30,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "Watch Trailer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Divider()
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        ));
  }
}
