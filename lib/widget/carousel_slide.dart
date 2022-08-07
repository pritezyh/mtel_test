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
      //Use imageconstant for build carousel
      itemCount: ImageConstants.urlImages.length,
      itemBuilder: ((context, index, realIndex) {
        final urlImage = ImageConstants.urlImages[index];
        //Send image url to buildImage function for create image
        return buildImage(urlImage);
      }),
    );
  }

  Widget buildImage(String urlImages) {
    //this function need image's url for create image in carousel
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blue,
      child: GestureDetector(
        onTap: () {
          //onTap is function push to another page when user push on carousel's image
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Page2(
                    // Second page need image from carousel so should send image to second page
                    imageUrl: urlImages,
                  )),
            ),
          );
        },
        // Imagenetwork need url for show image
        child: Image.network(
          urlImages,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
