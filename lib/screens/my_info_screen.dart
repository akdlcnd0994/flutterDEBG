import 'package:flutter/material.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
