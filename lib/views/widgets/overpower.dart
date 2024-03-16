import 'package:flutter/material.dart';
import '../../script/EncodePassword.dart';

class OverPower extends StatefulWidget {
  const OverPower({super.key});

  @override
  State<OverPower> createState() => _OverPower();
}

class _OverPower extends State<OverPower> {
  Map<String, dynamic> textvalue = {
    'value': "",
  };

  Map<String, dynamic> values = {
    'mayus': false,
    'minus': false,
    'num': false,
    'symbol': false,
    'radio': ''
  };

  double sliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [getlenghtOption(), getRadio(), getCheckBox()],
    );
  }

  Widget getlenghtOption() {
    return Center(
      child: Container(
        width: 200,
        child: Column(
          children: [
            Text("${textvalue["value"]}"),
            getSlider(),
            TextField(
              autofocus: false,
              maxLength: 20,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Longitud de la Contraseña",
                  hintText: "Ingresa un numero"),
              onChanged: (number) {
                if (number.length > 0) {
                  String newPassword = generateRandomPassword(int.parse(number),
                      includeLowercase: values["minus"],
                      includeUppercase: values["mayus"],
                      includeNumbers: values["num"],
                      includeSpecialCharacters: values["symbol"]);
                  textvalue['value'] = newPassword;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getCheckBox() {
    return Container(
      width: 200,
      child: Column(
        children: [
          CheckboxListTile(
            title: const Text("Mayúsculas"),
            value: values["mayus"],
            onChanged: (newValue) {
              values["mayus"] = newValue;
              setState(() {});
            },
          ),
          CheckboxListTile(
            title: const Text("Minúsculas"),
            value: values["minus"],
            onChanged: (newValue) {
              values["minus"] = newValue;
              setState(() {});
            },
          ),
          CheckboxListTile(
            title: const Text("Números"),
            value: values["num"],
            onChanged: (newValue) {
              values["num"] = newValue;
              setState(() {});
            },
          ),
          CheckboxListTile(
            title: const Text("Simbolos"),
            value: values["symbol"],
            onChanged: (newValue) {
              values["symbol"] = newValue;
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  Widget getSlider() {
    return Slider(
        max: 100,
        value: sliderValue,
        divisions: 100,
        label: sliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            String newPassword = generateRandomPassword(value.round(),
                includeLowercase: values["minus"],
                includeUppercase: values["mayus"],
                includeNumbers: values["num"],
                includeSpecialCharacters: values["symbol"]);
            sliderValue = value;
            textvalue['value'] = newPassword;
          });
        });
  }

  Widget getRadio() {
    return Container(
      width: 200,
      child: Column(
        children: [
          RadioListTile(
            title: const Text("Facil de leer"),
            value: 'easy',
            groupValue: values["radio"],
            onChanged: (newValue) {
              values["radio"] = newValue;
              values["mayus"] = true;
              values["minus"] = true;
              values["num"] = false;
              values["symbol"] = false;

              setState(() {});
            },
          ),
          RadioListTile(
            title: const Text("Todos los caracteres"),
            value: 'all',
            groupValue: values["radio"],
            onChanged: (newValue) {
              values["radio"] = newValue;
              values["mayus"] = true;
              values["minus"] = true;
              values["num"] = true;
              values["symbol"] = true;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
