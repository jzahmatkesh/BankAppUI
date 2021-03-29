import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 29, 33, 1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              SizedBox(height: 25),
              Stack(
                children: [
                  Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()..rotateZ(-15 * 3.1415927 / 180),
                    child: Container(
                      height: 210,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(38)
                      ),
                    ),
                  ),
                  Container(
                    height: 210,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(38)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //MasterCard Icon
                        Container(
                          width: 30,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.yellow,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10), 
                        Text('Card name', style: TextStyle(color: Colors.grey)),
                        Text('Master Card', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 15), 
                        Text('**** **** **** **** 5689', style: TextStyle(fontSize: 22)),
                        SizedBox(height: 15), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('Exp date', style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 3), 
                                Text('22/5'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Cvv2 num', style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 3), 
                                Text('0933'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 42,),
              Text('Send Money', style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              //users avatar
              Container(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration:BoxDecoration(
                            border: Border.all(color: Colors.white24),
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Icon(CupertinoIcons.add),
                        ),
                        SizedBox(height: 5),
                        Text('Add')
                      ],
                    ),
                    SizedBox(width: 18),
                    UserAvatar(id: 1, name: 'Nicole',),
                    SizedBox(width: 18),
                    UserAvatar(id: 2, name: 'Mahmud',),
                    SizedBox(width: 18),
                    UserAvatar(id: 3, name: 'Jastin',),
                    SizedBox(width: 18),
                    UserAvatar(id: 4, name: 'Raha',),
                    SizedBox(width: 18),
                    UserAvatar(id: 5, name: 'Sarahi',),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Missing', style: TextStyle(fontSize: 22),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(18)
                    ),
                    child: DropdownButton<int>(
                      value: 0,
                      underline: Container(),
                      items: [
                        DropdownMenuItem(value: 0,child: Text('Today'))
                      ],
                      onChanged: (val){},
                    )
                  )
                ],
              ),
              SizedBox(height: 15),
              MoneyWidget(
                color: Colors.yellow, 
                symbol: 'bitcoin',
                icon: Icon(CupertinoIcons.bitcoin, size: 32),
                perc: 125.0,
                textcolor: Colors.greenAccent,
              ),
              MoneyWidget(
                color: Colors.greenAccent, 
                symbol: 'Dollar',
                icon: Icon(CupertinoIcons.money_dollar, size: 32),
                perc: 52.6,
                textcolor: Colors.red,
              ),
              MoneyWidget(
                color: Colors.orange, 
                symbol: 'Forex',
                icon: Icon(CupertinoIcons.money_yen, size: 32),
                perc: 16,
                textcolor: Colors.greenAccent,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Color.fromRGBO(26, 29, 33, 1)),
        child: BottomNavigationBar(
          fixedColor: Colors.white,
          currentIndex: 0,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.circle, size: 10,), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'CHART'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
          ],
        ),
      ),
    );
  }
}

class MoneyWidget extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String symbol;
  final double perc;
  final Color textcolor;
  const MoneyWidget({
    Key key,
    @required this.color, @required this.symbol, @required this.icon, @required this.perc, @required this.textcolor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 6),
      height: 75,
      decoration: BoxDecoration(
        color: Color.fromRGBO(34,37,42,1),
        borderRadius: BorderRadius.circular(18)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: this.color,
                child: this.icon,
              ),
              Text('$symbol'),
            ],
          ),
          Container(
            width: 1,
            color: Colors.grey,
          ),
          Text('Today', style: TextStyle(color: Colors.grey)),
          Container(
            width: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Icon(CupertinoIcons.arrowtriangle_up_fill, color: Colors.greenAccent, size: 15,),
              Text('$perc %', style: TextStyle(color: this.textcolor),)
            ],
          )
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String name;
  final int id;
  const UserAvatar({
    Key key,
    @required this.id, @required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('images/user$id.jpg'),
        ),
        SizedBox(height: 5),
        Text('$name')
      ],
    );
  }
}