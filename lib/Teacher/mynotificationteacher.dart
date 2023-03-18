import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mynotificationteacher extends StatelessWidget {
  const Mynotificationteacher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentuser = FirebaseAuth.instance.currentUser!.email;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('My notifications'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User-Notification')
            .doc(currentuser)
            .collection('My-notification')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty || snapshot.data == null) {
              return const Scaffold(
                body: Center(
                  child: Text(
                    'You haven\'t added any notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 161, 46, 46),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      DocumentSnapshot x = snapshot.data!.docs[i];
                      return Card(
                            elevation: 10,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding:
                                          const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                      child: Text(
                                        x["Time"],
                                        style:const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(x['Notification']),
                                ),
                              ],
                            ));
                    }),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ));
  }
}
