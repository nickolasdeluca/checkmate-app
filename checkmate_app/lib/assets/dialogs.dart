import 'package:checkmate_app/models/items/item.dart';
import 'package:flutter/material.dart';

dynamic _doubleValidator(String? value) {
  if ((value != null) && (value.isNotEmpty)) {
    try {
      double.parse(value);
    } on Exception {
      return "Must be a positive real number!";
    }
  }

  return null;
}

InputDecoration _defaultDecoration = const InputDecoration(
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
);

class Dialogs {
  newItem(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    Item item = Item(0, '', 0, 0);

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Row(
                    children: const [
                      Text('Add a new item',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Spacer(),
                      SizedBox(
                        width: 35,
                        child: CloseButton(),
                      ),
                    ],
                  ),
                  const Text('Name'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: _defaultDecoration,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Price'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: _defaultDecoration.copyWith(
                      suffixIcon: const Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return _doubleValidator(value);
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Amount'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: amountController,
                    decoration: _defaultDecoration.copyWith(
                      suffixIcon: const Icon(
                        Icons.production_quantity_limits,
                        color: Colors.black,
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return _doubleValidator(value);
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          onSurface: Colors.white,
                          shape: const BeveledRectangleBorder()),
                      onPressed: () {
                        if (nameController.text.isEmpty) {
                          return;
                        }

                        if (priceController.text.isEmpty) {
                          return;
                        }

                        if (amountController.text.isEmpty) {
                          return;
                        }

                        item.name = nameController.text;
                        item.price = double.parse(priceController.text);
                        item.amount = double.parse(amountController.text);

                        Navigator.pop(context);
                      },
                      child: const Text('Add'))
                ],
              ),
            ),
          );
        });
  }
}
