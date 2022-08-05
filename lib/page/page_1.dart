import 'package:flutter/material.dart';
import 'package:flutter_mtel/cons/ui_strings.dart';
import 'package:flutter_mtel/widget/carousel_slide.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UiString.mtelPage1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CarouselSlide(),
              const SizedBox(height: 20),
              buildRows(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRows(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 500,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                index.toString(),
              ),
            );
          }),
    );
  }
}
