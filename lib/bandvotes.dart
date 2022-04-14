import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class MockBandInfo {
//   const MockBandInfo({required this.name, required this.votes});
//   final String name;
//   final int votes;
// }

class VotesPage extends StatelessWidget {
  const VotesPage({Key? key, required String title}) : super(key: key);

  // static const List<MockBandInfo> _bandList = [
  //   const MockBandInfo(name: "Name 1", votes: 1),
  //   const MockBandInfo(name: "Name 2", votes: 2),
  //   const MockBandInfo(name: "Name 3", votes: 3),
  //   const MockBandInfo(name: "Name 4", votes: 4),
  // ];

  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
              child: Text(
            document['name'].toString(),
            style: Theme.of(context).textTheme.headline6,
          )),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(255, 222, 255, 1)),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['votes'].toString(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
      onTap: () {
        print("increase vote count");
        document.reference.update({'votes': document['votes'] + 1});
        // document.reference.set({'time': DateTime.now()});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Band Names"),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bandnames').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) const Text("Loading....");
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data!.docs[index]),
          );
        },
      ),
    );
  }
}
