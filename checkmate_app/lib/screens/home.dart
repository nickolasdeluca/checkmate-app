import 'dart:async';

import 'package:checkmate_app/assets/constants.dart';
import 'package:checkmate_app/models/entries/entry.dart';
import 'package:checkmate_app/screens/new_entry.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Future<List<Entry>>? _getItems() async {
  Box box = Hive.box<Entry>('entries');
  List<Entry> entries = [];
  for (var value in box.values) {
    entries.add(value);
  }

  return entries;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Entries',
                        style: TextStyle(
                            color: cConstrastColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => const NewEntry());
                          Navigator.push(context, route).then(
                            (value) => {setState(() {})},
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: cConstrastColor,
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: FutureBuilder(
                  future: _getItems(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Entry>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 75,
                              child: Card(
                                shadowColor: cConstrastColor,
                                elevation: 5,
                                child: ListTile(
                                  title: Text(
                                      'Where: ${snapshot.data![index].place.toString()}'),
                                  subtitle: Text(
                                      'When: ${snapshot.data![index].date.toString()}'),
                                  trailing: GestureDetector(
                                    child: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                    onTap: () {
                                      Route route = MaterialPageRoute(
                                        builder: (context) => NewEntry(
                                          boxKey: snapshot.data![index].key,
                                        ),
                                      );
                                      Navigator.push(context, route).then(
                                        (value) => {setState(() {})},
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                )),
              ],
            ),
          )),
    );
  }
}
