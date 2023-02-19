import 'package:flutter/material.dart';

class Homepageteacher extends StatelessWidget {
  const Homepageteacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body1(context),
    );
  }

  Widget body1(BuildContext context) {

    
    return (Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: Colors.white,
                  elevation: 2,
                  foregroundColor: Colors.black,
                ),
                child: const Text(' ATTENDANCE'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, "navigatingtoattendancemarkcheck");
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: Colors.white,
                  elevation: 2,
                  foregroundColor: Colors.black,
                ),
                child: const Text(' INTERNAL MARK'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, "navigatingtoteacheraccountsignup");
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: Colors.white,
                  elevation: 2,
                  foregroundColor: Colors.black,
                ),
                child: const Text(' SEMESTER EXAM '),
                onPressed: () {
                  Navigator.pushNamed(
                      context, "navigatingtoteacheraccountsignup");
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: Colors.white,
                  elevation: 2,
                  foregroundColor: Colors.black,
                ),
                child: const Text(' NOTES'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, "navigatingtoteacheraccountsignup");
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: Colors.white,
                  elevation: 2,
                  foregroundColor: Colors.black,
                ),
                child: const Text(' NOTIFICATION'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, "navigatingtoteacheraccountsignup");
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
