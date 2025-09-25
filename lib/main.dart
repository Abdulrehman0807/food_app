import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/modelclass.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();

  List<String> options = [
    'Pizza',
    'Burger',
    'Salad',
    'Fruit',
    'Cake',
    'Vegitable'
  ];
  int selected_index = 0;

  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: hieght,
      width: width,
      color: Colors.white,
      child: Stack(
        children: [
          SizedBox(
            height: hieght,
            width: width,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (value) {
                print(value);
                setState(() {
                  index = value;
                });
              },
              children: [
                Container(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                        height: hieght * 0.10,
                        color: Colors.brown,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    DateFormat('MMMM d, yyyy').format(now),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    width: width * 0.6,
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Programs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          height: hieght * 0.07,
                          width: width,
                          color: Colors.red,
                          child: ListView.builder(
                              itemCount: options.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected_index = index;
                                    });
                                  },
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      options[index],
                                      style: TextStyle(
                                        color: selected_index == index
                                            ? Colors.white
                                            : Colors.grey.shade200,
                                        fontSize:
                                            selected_index == index ? 20 : 18,
                                        fontWeight: selected_index == index
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  )),
                                );
                              }))),
                      Container(
                          height: hieght * 0.83,
                          width: width,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Container(
                                height: hieght * 0.15,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              ),
                              Positioned(
                                top: 30,
                                left: 60,
                                child: Container(
                                  height: hieght * 0.25,
                                  width: width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 108.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            "Ceaser Salad",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            "Bacon,toast,rom..",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            height: hieght * 0.030,
                                            width: width * 0.20,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "MEDIUM",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "\$ 7.5",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20, left: 120),
                                          child: Container(
                                            height: hieght * 0.05,
                                            width: width * 0.30,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 50,
                                  left: 30,
                                  child: Container(
                                    height: hieght * 0.18,
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/biryani.jpg"),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle),
                                  )),
                              Positioned(
                                top: 250,
                                child: Container(
                                  height: hieght * .07,
                                  width: width,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Papular Now   .  ",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          "10 dishes",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 100,
                                left: 40,
                                child: Container(
                                  height: hieght * .33,
                                  width: width * .8,
                                  color: Colors.grey.shade200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: ModelClass.mylist.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Container(
                                                  height: hieght * .2,
                                                  width: width * .4,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              '${ModelClass.mylist[index].img}'),
                                                          fit: BoxFit.cover)),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: hieght * .10,
                                            width: width * .4,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    ModelClass
                                                        .mylist[index].title!,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(ModelClass
                                                      .mylist[index].subtitle!),
                                                  Text(ModelClass
                                                      .mylist[index].tex!)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                    color: Colors.pink,
                    child: Column(
                      children: [
                        Container(
                          height: hieght,
                          width: width,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Customer Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                height: hieght * 0.2,
                                child: Image(
                                  image: AssetImage("images/biryani.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Biryani Khanbaba",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Owais Mehmood",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Omehmood53",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: hieght * 0.07,
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.arrow_back_ios_new_sharp),
                              Text(
                                "vegan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Icon(Icons.menu_book_rounded)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: hieght * 0.1,
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Organic",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "Vegetable set",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: hieght * 0.09,
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.view_comfortable_rounded),
                                      Text(
                                        "168 ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        "kcal ",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.punch_clock_outlined),
                                      Text(
                                        "10 mins ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        "cook time ",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: hieght * 0.037,
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade700,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    '3 Results',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: hieght * 0.7,
                        width: width,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 110,
                              right: 60,
                              child: Container(
                                height: hieght * 0.40,
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 15,
                                          offset: const Offset(0, 0)),
                                    ],
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Positioned(
                              top: 90,
                              right: 90,
                              child: Container(
                                height: hieght * 0.45,
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 15,
                                          offset: const Offset(0, 0)),
                                    ],
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Positioned(
                              top: 70,
                              right: 120,
                              child: Container(
                                height: hieght * 0.5,
                                width: width * 0.55,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 15,
                                          offset: const Offset(5, 5)),
                                    ],
                                    color: Colors.white.withOpacity(1.0),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: hieght * 0.035,
                                            width: width * 0.16,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '\$75',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'RED',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text(
                                            "iauicba iasiod u  u iyasioy ioaoi  yasoid yasio",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      'images/biryani.jpg',
                                      height: 200,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: hieght * 0.037,
                                            width: width * 0.18,
                                            decoration: BoxDecoration(
                                              color: Colors.yellow.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Explore',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 3,
            child: Container(
              height: hieght * 0.1,
              width: width * 0.98,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      controller.jumpToPage(0);
                    },
                    child: Icon(
                      Icons.home,
                      color: index == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.jumpToPage(1);
                    },
                    child: Icon(
                      Icons.person,
                      color: index == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    child: Icon(
                      Icons.menu,
                      color: index == 2 ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
