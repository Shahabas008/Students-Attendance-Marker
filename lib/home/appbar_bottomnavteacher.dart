
import 'package:collegeproject/home/calendarpage.dart';
import 'package:collegeproject/Teacher/menu.dart';

import 'package:flutter/material.dart';


class Homepagelayout extends StatefulWidget {
  const Homepagelayout({super.key});

  @override
  State<Homepagelayout> createState() => _HomepagelayoutState();
}

class _HomepagelayoutState extends State<Homepagelayout> {
  bool isCustomer = false;

  // void decider() async {
  //   DocumentSnapshot currentUser = await FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(FirebaseAuth.instance.currentUser!.email)
  //       .get();

  //   if (currentUser.get("categorys") == "customer") {
  //     setState(() {
  //       isCustomer = true;
  //     });

  //     return;
  //   }
  //   setState(() {
  //     isCustomer = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // decider();
  }

  int pageIndex = 0;

  final teacherpages = [
     Menupage(teachername: '', classname: '', subjectname: ' ',),
    const Calendarpage(),
    // const notificationpage(),
    // const profilepage(),
  ];
  // final customerPages = [
  //   const HomepageCustomer(),
  //   const Favoritepage(),
  //   const Cartpage(),
  //   const Profilepagecustomer(),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: isCustomer ? homepaget[pageIndex] : sellerPages[pageIndex],
        body:  teacherpages[pageIndex],
        backgroundColor:  const Color.fromARGB(255, 234, 234, 234),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 161, 46, 46),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.calendar_month,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 35,
                      )
                    : const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 35,
                      )
                    : const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 35,
                      )
                    : const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
