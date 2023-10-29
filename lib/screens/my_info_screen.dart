import 'package:flutter/material.dart';
import 'package:medicalapp/screens/login/welcome_screen.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.savings,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
        title: const ListTile(
          title: Text(
            'More',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w900
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 190,
                color: Colors.pinkAccent.shade100,
              ),
            ],
          ),
          SizedBox(height: 5,),
          Column(
            children: [
              Text(
                'NickName',
                style:
                TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w900
                ),
              ),
              Text('ID:Email'),
            ],
          ),
          SizedBox(height: 30,),
          
          Container( height:1.0,
            width:400.0,
            color:Colors.grey,
          ),

          SizedBox(height: 30,),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 15,),
                  IconButton(
                    onPressed: () {
                        print('1');
                      },
                    icon:
                      Icon(
                        Icons.account_circle_outlined,
                        size: 35,
                      ),
                  ),
                  SizedBox(width: 5,),
                  Text('abcdefg',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  IconButton(
                    onPressed: () {
                      print('1');
                    },
                    icon:
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text('abcdefg',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  IconButton(
                    onPressed: () {
                      print('1');
                    },
                    icon:
                    Icon(
                      Icons.access_time_outlined,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text('abcdefg',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  IconButton(
                    onPressed: () {
                      print('1');
                    },
                    icon:
                    Icon(
                      Icons.add_card_outlined,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text('abcdefg',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.grey[400],
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: height * 0.06,
                      width: width * 0.6,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "로그인 후 이용이 가능합니다.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
