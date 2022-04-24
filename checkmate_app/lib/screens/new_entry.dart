import 'package:checkmate_app/assets/constants.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({Key? key}) : super(key: key);

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  TextEditingController localController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        title: const Text('Add a new entry'),
        backgroundColor: cBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Data',
                style: TextStyle(
                    color: cConstrastColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DateTimeFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cConstrastColor)),
                    suffixIcon: Icon(
                      Icons.event_note,
                      color: cConstrastColor,
                    ),
                    floatingLabelStyle: TextStyle(color: cConstrastColor)),
                mode: DateTimeFieldPickerMode.date,
                dateTextStyle: const TextStyle(color: cConstrastColor),
                initialValue: DateTime.now(),
                onDateSelected: (DateTime value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Local',
                style: TextStyle(
                    color: cConstrastColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: localController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cConstrastColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cConstrastColor)),
                    suffixIcon: Icon(
                      Icons.place,
                      color: cConstrastColor,
                    ),
                    floatingLabelStyle: TextStyle(color: cConstrastColor)),
                style: const TextStyle(color: cConstrastColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Consumo',
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
              Flexible(
                  child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 75,
                      child: InkWell(
                        child: Card(
                          shadowColor: cConstrastColor,
                          elevation: 5,
                          child: ListTile(
                            title: Text('Produto: Gelada'),
                            subtitle: Text('Quantidade: 10 - Valor: R\$10,00'),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: InkWell(
                        child: Card(
                          shadowColor: cConstrastColor,
                          elevation: 5,
                          child: ListTile(
                            title: Text('Produto: Gelada'),
                            subtitle: Text('Quantidade: 10 - Valor: R\$10,00'),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: InkWell(
                        child: Card(
                          shadowColor: cConstrastColor,
                          elevation: 5,
                          child: ListTile(
                            title: Text('Produto: Gelada'),
                            subtitle: Text('Quantidade: 10 - Valor: R\$10,00'),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: InkWell(
                        child: Card(
                          shadowColor: cConstrastColor,
                          elevation: 5,
                          child: ListTile(
                            title: Text('Produto: Gelada'),
                            subtitle: Text('Quantidade: 10 - Valor: R\$10,00'),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: InkWell(
                        child: Card(
                          shadowColor: cConstrastColor,
                          elevation: 5,
                          child: ListTile(
                            title: Text('Produto: Gelada'),
                            subtitle: Text('Quantidade: 10 - Valor: R\$10,00'),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: InkWell(
                        child: Card(
                          shadowColor: cConstrastColor,
                          elevation: 5,
                          child: ListTile(
                            title: Text('Produto: Gelada'),
                            subtitle: Text('Quantidade: 10 - Valor: R\$10,00'),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
