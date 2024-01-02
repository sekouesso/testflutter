import 'package:flutter/material.dart';

class MyDesign extends StatelessWidget {
  const MyDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Design'),),
      body:  SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 2,),
              titleSection,
              searchSection,
              boxSection,
              containerSection,
              rowSection,
              iconSection,
              lineSection,
              subTitleSection,
              bottomSection,
              testContainer,
            ],
          ),
      )
    );
  }
}
Widget titleSection = Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Home Page',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 50,
        width: 50,
        child: const CircleAvatar(
          backgroundImage: AssetImage("images/profile1.jpg") ,
          radius: 40,
        ),
      )
    ],
  ),
);

Widget searchSection = Container(
  margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(10),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Icon(
        Icons.search,
        color: Colors.grey,
      ),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          'Search',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      Icon(
        Icons.mic_none,
        color: Colors.grey,
      ),
    ],
  ),
);

Widget boxSection = Container(
  width: double.infinity,
  padding: const EdgeInsets.all(25),
  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.indigoAccent,
        Colors.indigo,
      ],
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Jing A studio',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'Tell me your dream',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      const SizedBox(height: 10),
      Text(
        'Invite friends to sell 1000 red packets',
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 15,
          fontWeight: FontWeight.w200,
        ),
      ),
      const SizedBox(height: 10),
       ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.pinkAccent,//change background color of button
          onPrimary: Colors.white,//change text color of button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 15.0,
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Proceed to Pay',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    ],
  ),
);

Widget containerSection = Container(
  height: 200,
  width: double.infinity,
  margin: const EdgeInsets.all(20),
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.blue,
        Colors.green,
      ],
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Titre',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      const Text('Sous-titre'),
      ElevatedButton(onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red) ),
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 30,
        ),
      ), //const Text(' Acheter',style: TextStyle(color: Colors.white),)),
    ],
  ),
);

Widget rowSection = Container(
  color: Colors.black,
  height: 100,
  margin: EdgeInsets.all(20),
  child: Row(
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Expanded(
        child: Container(
          color: Colors.amber,
        ),
      ),
      Container(
        color: Colors.purple,
        height: 100,
        width: 100,
      ),
    ],
  ),
);

Widget iconSection = Container(
  padding: const EdgeInsets.all(10),
  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.new_releases,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 5),
          const Text('New')
        ],
      ),
      Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.school,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Skill')
          ],
        ),
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.dashboard,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 5),
          const Text('Easel')
        ],
      ),
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.business,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 5),
          const Text('Room')
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.purple[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.pin_drop,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 5),
          const Text('Project')
        ],
      ),
    ],
  ),
);

Widget lineSection = Container(
  color: Colors.grey[200],
  padding: const EdgeInsets.all(4),
);

Widget subTitleSection = Container(
  margin: const EdgeInsets.all(20),
  child: Row(
    children: [
      Container(
        color: Colors.indigoAccent,
        width: 5,
        height: 25,
      ),
      const SizedBox(width: 10),
      const Text(
        'Curriculum',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  ),
);

Widget bottomSection = Container(
  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
  child: Column(
    children: [
      Container(
        height: 130,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.indigoAccent,
                    Colors.indigo,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.white, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Elite class',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Central Quing elite class',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Elite first choice rapid improuvmentof painting ability', // choice rapid improuvmentof painting ability
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Container(
        height: 130,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange,
                    Colors.orange.shade900,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.white, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Design class',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Central Quing design class',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Elite first choice rapid improuvmentof painting ability', // choice rapid improuvmentof painting ability
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget testContainer = Container(
  margin: EdgeInsets.only(top: 10),
  color: Colors.cyan,height: 50.0,
  child: Center(child: Text("Copy Right C 2022 SEKOU E.....")),
);