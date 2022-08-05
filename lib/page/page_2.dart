import 'package:flutter/material.dart';
import 'package:flutter_mtel/cons/ui_strings.dart';
import 'package:flutter_mtel/widget/dropdown_button.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  bool selectedDate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTel Page 2'),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(widget.imageUrl),
                  _buildTextFormfiled(),
                  _buildDatepicker(),
                  const DropdownButtonMtel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormfiled() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      width: double.infinity,
      child: TextFormField(
        maxLength: 13,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          counterText: UiString.nullString,
          hintText: UiString.idCardHint,
          prefixIcon: Icon(Icons.person),
        ),
        validator: (value) {
          if (value!.isEmpty || value.length < 13) {
            return 'Not correct';
          } else {
            return null;
          }
        },
        onSaved: ((newValue) {
          if (!_formKey.currentState!.validate()) {
            return;
          }
        }),
      ),
    );
  }

  Widget _buildDatepicker() {
    return GestureDetector(
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2030),
        );
        if (newDate == null) return;
        setState(() {
          selectedDate = true;
          dateTime = newDate;
        });
      },
      child: Container(
          height: 50,
          width: 200,
          color: Colors.blue,
          child: Center(
            child: Text(selectedDate
                ? '${dateTime.year}/${dateTime.month}/${dateTime.day}'
                : UiString.dateTimePickerHint),
          )),
    );
  }
}
