import 'package:flutter/material.dart';
import 'package:flutter_mtel/cons/dropdown_const.dart';
import 'package:flutter_mtel/cons/ui_strings.dart';

class DropdownButtonMtel extends StatefulWidget {
  const DropdownButtonMtel({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMtel> createState() => _DropdownButtonMtelState();
}

class _DropdownButtonMtelState extends State<DropdownButtonMtel> {
  late String selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 240,
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: UiString.dropdownHint,
        ),
        items: DropdownConst.dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (item) => setState(
          () {
            selectedItem = item.toString();
          },
        ),
      ),
    );
  }
}
