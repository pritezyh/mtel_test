import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mtel/cons/image_const.dart';
import 'package:flutter_mtel/page/page_2.dart';

class CarouselSlide extends StatefulWidget {
  const CarouselSlide({Key? key}) : super(key: key);

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(height: 200, autoPlay: true),
      itemCount: ImageConstants.urlImages.length,
      itemBuilder: ((context, index, realIndex) {
        final urlImage = ImageConstants.urlImages[index];
        return buildImage(urlImage, index);
      }),
    );
  }

  Widget buildImage(String urlImages, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blue,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Page2(
                    imageUrl: urlImages,
                  )),
            ),
          );
        },
        child: Image.network(
          urlImages,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
