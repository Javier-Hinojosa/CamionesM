import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesCarrousel extends StatelessWidget{

   const ImagesCarrousel({super.key, required this.images, required this.carouselController,required this.onPageChanged,required this.valueIndex });

  final List<String> images;
  final CarouselController carouselController;
  final int valueIndex;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: CarouselSlider(
              items: generateImageTiles(),
              carouselController: carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  onPageChanged: onPageChanged))),
      Positioned(
          bottom: 10.0,
          left: 0.0,
          right: 0.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images
                  .asMap()
                  .entries
                  .map((entry) => GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(valueIndex == entry.key ? 0.9 : 0.4)))))
                  .toList()))
    ]);
  }


  List<Widget> generateImageTiles() {
    return images
        .map((element) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Image.asset(element, fit: BoxFit.cover, width: 1000.0)))
        .toList();
  }



}