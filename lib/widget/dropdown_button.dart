import 'package:flutter/material.dart';
import 'package:flutter_mtel/cons/dropdown_const.dart';
import 'package:flutter_mtel/cons/ui_strings.dart';

class DropdownButtonMtel extends StatefulWidget {
  const DropdownButtonMtel({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMtel> createState() => _DropdownButtonMtelState();
}

class _DropdownButtonMtelState extends State<DropdownButtonMtel> {
  //selectedItem is null for show hint text
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
        //use dropdown constant for create deopdown menu item
        items: DropdownConst.dropdownItems
            .map(
                //Convert value in dropdown constant to map and create new dropdown menuitem
                (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
            //then convert to list again
            .toList(),

        onChanged: (item) => setState(
          //then user selected item set new item
          () {
            selectedItem = item.toString();
          },
        ),
      ),
    );
  }
}
