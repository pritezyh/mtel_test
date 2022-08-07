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
  // formkey use for vilidate textformfield
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // use datetime for show current date in date picker
  DateTime dateTime = DateTime.now();
  // set selectedDate to false cause show Selected Date on button
  bool selectedDate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTel Page 2'),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //This is all widget in second page
                  //Show image from carousel by Image.network
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
      height: 100,
      width: double.infinity,
      child: TextFormField(
        maxLength: 13,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            //when validate return false color border will change from blue to red
            borderSide: const BorderSide(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          counterText: UiString.nullString,
          hintText: UiString.idCardHint,
          prefixIcon: const Icon(Icons.person),
        ),
        validator: (value) {
          //when user tap on succes button on keyboard application will validate value
          if (value!.isEmpty || value.length < 13) {
            //if value is empty or value length is less than 13 will return false and show error message
            return 'Please enter number';
          } else {
            return null;
          }
        },
        onEditingComplete: () {
          //this function use on user tap on succes button in keyboard will call this function for validate
          if (_formKey.currentState!.validate()) {
            return;
          }
        },
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
        //line 98 when user no selecte or tap cancel button in datepicker  date will pop and retuen nothing
        if (newDate == null) return;
        setState(() {
          //then user selected date set new value on selectedDate to true and set new dateTime value
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
