import 'package:checkmate_app/assets/constants.dart';
import 'package:checkmate_app/assets/dialogs.dart';
import 'package:checkmate_app/models/entries/entry.dart';
import 'package:checkmate_app/models/items/item.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NewEntry extends StatefulWidget {
  final Entry? remoteEntry;
  const NewEntry({Key? key, this.remoteEntry}) : super(key: key);

  @override
  State<NewEntry> createState() => _NewEntryState();
}

InputDecoration _inputBorder = const InputDecoration(
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: cConstrastColor)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: cConstrastColor)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
);

class _NewEntryState extends State<NewEntry> {
  Entry entry = Entry(id: 0, items: []);
  Future<List<Item>>? _getItems() async {
    return entry.items;
  }

  @override
  void initState() {
    entry = widget.remoteEntry ?? Entry(id: 0, items: []);
    localController.text = entry.place ?? "";

    super.initState();
  }

  dynamic _textValidator(String? value) {
    if ((value != null) && (value.isNotEmpty)) {
    } else {
      return "You must provide a location";
    }
  }

  DateTime _getInitialDate() {
    return entry.date ?? DateTime.now();
  }

  void _saveEntry() async {
    if (kDebugMode) {
      print(entry.toJson());
    }

    if (localController.text.isEmpty) {
      return;
    }

    entry.place = localController.text;

    Box box = Hive.box<Entry>('entries');

    box.add(entry);
  }

  TextEditingController localController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        title: const Text('Add a new entry'),
        backgroundColor: cBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: (() {
                  _saveEntry();
                  Navigator.pop(context);
                }),
                child: const Icon(
                  Icons.save,
                  color: cConstrastColor,
                  size: 25,
                ),
              ))
        ],
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
                'When',
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
                mode: DateTimeFieldPickerMode.dateAndTime,
                dateTextStyle: const TextStyle(color: cConstrastColor),
                initialValue: _getInitialDate(),
                onDateSelected: (DateTime value) {
                  entry.date = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Where',
                style: TextStyle(
                    color: cConstrastColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: _inputBorder.copyWith(
                  floatingLabelStyle: const TextStyle(color: cConstrastColor),
                  suffixIcon: const Icon(
                    Icons.place,
                    color: cConstrastColor,
                  ),
                ),
                controller: localController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return _textValidator(value);
                },
                style: const TextStyle(color: cConstrastColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Items',
                  style: TextStyle(
                      color: cConstrastColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Dialogs().newItem(context).then((value) {
                      entry.items.add(value);
                      setState(() {});
                    });
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
                builder:
                    (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 75,
                            child: InkWell(
                              child: Card(
                                shadowColor: cConstrastColor,
                                elevation: 5,
                                child: ListTile(
                                  title: Text(snapshot.data![index].name),
                                  subtitle: Text(
                                      'Amount: ${snapshot.data![index].amount} - Price: ${snapshot.data![index].price}'),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded),
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
        ),
      ),
    );
  }
}
