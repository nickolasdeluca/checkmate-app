import 'package:checkmate_app/assets/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
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
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: cConstrastColor,
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 85,
                  child: InkWell(
                    child: Card(
                      shadowColor: cConstrastColor,
                      elevation: 5,
                      child: ListTile(
                        title: Text('Data: 23/04/2022'),
                        subtitle: Text('Local: Antonio\'s '),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 85,
                  child: InkWell(
                    child: Card(
                      shadowColor: cConstrastColor,
                      elevation: 5,
                      child: ListTile(
                        title: Text('Data: 24/04/2022'),
                        subtitle: Text('Local: Let\'s Drop Pub'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 85,
                  child: InkWell(
                    child: Card(
                      shadowColor: cConstrastColor,
                      elevation: 5,
                      child: ListTile(
                        title: Text('Data: 25/04/2022'),
                        subtitle: Text('Local: Pomar'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 85,
                  child: InkWell(
                    child: Card(
                      shadowColor: cConstrastColor,
                      elevation: 5,
                      child: ListTile(
                        title: Text('Data: 26/04/2022'),
                        subtitle: Text('Local: Montalccino'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 85,
                  child: InkWell(
                    child: Card(
                      shadowColor: cConstrastColor,
                      elevation: 5,
                      child: ListTile(
                        title: Text('Data: 26/04/2022'),
                        subtitle: Text('Local: Van Tap'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
