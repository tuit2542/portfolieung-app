import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/fullscreen_widget.dart';

class CarouselExample extends StatelessWidget {
  List<String> imageList;

  final CarouselSliderController controller;

  CarouselExample({
    super.key,
    required this.imageList,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      width: width * 0.8,
      height: height * 0.5,
      child: CarouselSlider(
        controller: controller,
        options: CarouselOptions(
          // autoPlay: true,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          enlargeFactor: 0.5,
        ),
        items: imageList.map(
          (fileName) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl: fileName,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  fileName,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class TextCarouselExample extends StatelessWidget {
  final List<String> textItems = [
    "Flutter makes UI development easy!",
    "Write once, run on multiple platforms.",
    "Hot reload speeds up development.",
    "Flutter uses the Dart programming language.",
    "Customizable widgets enhance UI flexibility.",
  ];

  TextCarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 50.0,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 3),
          scrollDirection: Axis.horizontal,
        ),
        items: textItems.map((text) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  final VoidCallback? onClick;

  final List<Map<String, IconData>> listStringIcons;

  const HorizontalListView({
    super.key,
    this.listStringIcons = const [
      {"Work": Icons.work_rounded},
      {"Home": Icons.home_rounded},
      {"National Airport": Icons.airplanemode_on_rounded},
      {"Hotel": Icons.hotel_rounded},
      {"Cafe": Icons.coffee_rounded},
      {"Gas": Icons.local_gas_station_rounded},
      {"Tesco Lotus": Icons.store_rounded},
    ],
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: listStringIcons.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: onClick,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 2.6,
                    spreadRadius: 0,
                    offset: Offset(
                      1.95,
                      1.95,
                    ),
                  ),
                ]),
            child: Row(
              children: [
                Icon(listStringIcons[index].values.first,
                    color: Colors.white, size: 30),
                const SizedBox(width: 5),
                Text(
                  listStringIcons[index].keys.first,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
