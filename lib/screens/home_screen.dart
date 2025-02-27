import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyperhire_assingment/generated/assets.dart';
import 'package:hyperhire_assingment/screens/product_detail.dart';
import 'package:hyperhire_assingment/widgets/widgets.dart';

import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final CarouselController imageController = CarouselController();
  final List<String> images = [
    Assets.imagesImg1,
    Assets.imagesImg2,
    Assets.imagesImg3,
    Assets.imagesImg4,
  ];

  int activeIndex = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  List<GoldLevelModel> goldLevelList = [];

  init() {
    goldLevelList.add(GoldLevelModel(
        name: "name1", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name2", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name3", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name4", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name5", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name6", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name7", imageUrl: 'https://picsum.photos/250/250'));
    goldLevelList.add(GoldLevelModel(
        name: "name8", imageUrl: 'https://picsum.photos/250/250'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        title: const Texts(
          "LOGO",
          color: Palette.appbarText,
          fontFamily: medium,
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchWidget(),
              imageWidget(),
              mainBody(),
              productWidget(),
              Container(
                height: 20,
                width: screenWidth,
                color: Palette.accentLight,
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              goldLevelUserWidget(),
              bottomBody()
            ],
          ),
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 3,
          color: Colors.transparent, // Border color set via shaderMask
        ),
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.indigo],
        ),
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey[600]),
          // prefixIcon: Icon(Icons.search, color: Colors.blue),
          suffixIcon: const Icon(Icons.search, color: Colors.blue),
          // Suffix icon
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Stack(
      children: [
        CarouselSlider.builder(
            carouselController: imageController,
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return buildImage(images[index], index);
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: 200,
              initialPage: 0,
              reverse: false,
              onPageChanged: (index, reason) {
                // ✅ Update activeIndex when page changes
                setState(() {
                  activeIndex = index;
                });
              },
              autoPlay: true,
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: buildIndicator(),
        ),
      ],
    );
  }

  Widget buildImage(String url, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        return Container(
          width: activeIndex == entry.key ? 12 : 8,
          height: activeIndex == entry.key ? 12 : 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeIndex == entry.key ? Colors.blue : Colors.grey,
          ),
        );
      }).toList(),
    );
  }

  Widget mainBody() {
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts(
                    "Check out the hottest reviews",
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Texts(
                    "Review ranking top 3",
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget productWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Stack(
                children: [
                  // Image Container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Palette.accentLight),
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    width: 104,
                    height: 104,
                    child: Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
                  ),

                  // Crown Icon (Positioned at Top Left)
                  Positioned(
                    top: 6, // Aligns to top
                    left: 6, // Aligns to left
                    child: Image.asset(Assets.imagesCrown),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Texts(
                    "LG Electronics",
                    fontSize: 14,
                    fontFamily: semiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),SizedBox(height: 5,),
                  const Texts(
                    "The screen is good",
                    fontSize: 12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),SizedBox(height: 5,),
                  const Texts(
                    "LG Electronics",
                    fontSize: 12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),SizedBox(height: 5,),
                  const Row(
                    children: [
                      Icon(Icons.star,size: 12, color: Color(0xffFFD233)),
                      Texts("4.6",
                          fontSize: 10,
                          fontFamily: semiBold,
                          color: Color(0xffFFD233)),
                      Texts("(105)",
                          fontSize: 10,
                          fontFamily: semiBold,
                          color: Color(0xffC4C4C4))
                    ],
                  ),SizedBox(height: 5,),
                  Container(
                    height: 20,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            color: Palette.accentLight,
                            child: const Texts("text", fontSize: 11),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            width: 5,
                          );
                        },
                        itemCount: 2),
                  )
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10,
          );
        },
        itemCount: 2);
  }

  Widget goldLevelUserWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texts(
            "These are gold level users",
            fontSize: 12,
          ),
          SizedBox(
            height: 10,
          ),
          Texts("Top 10 best reviews", fontSize: 18, fontFamily: medium),
          Container(
            height: 114,
            margin: EdgeInsets.only(top: 10),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      /// for dynamic data will pass here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetail()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ensures consistent spacing for all items
                        SizedBox(
                          height: 24, // Crown's height (adjust as needed)
                          child: index == 0
                              ? Image(image: AssetImage(Assets.imagesCrown))
                              : SizedBox(), // Empty space for other indexes
                        ),

                        Container(
                          height: 62,
                          width: 62,
                          margin: EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: index == 0 ? Colors.yellow : Colors.transparent,
                              width: 4,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(goldLevelList[index].imageUrl),
                            ),
                          ),
                        ),

                        Texts(
                          goldLevelList[index].name,
                          fontSize: 14,
                        ),
                      ],
                    )

                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: 5,
                  );
                },
                itemCount: goldLevelList.length),
          )
        ],
      ),
    );
  }

  String? selectedValue = "Option 1";
  final List<String> dropdownItems = ["Option 1", "Option 2", "Option 3"];

  Widget bottomBody() {
    return Container(
      color: Palette.accentLight,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Texts(
            "LOGO inc.",
            color: Palette.fontGrey,
            fontSize: 14,
            fontFamily: medium,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Texts("Company introduction",
                  color: Palette.fontGrey, fontSize: 13),
              Container(
                color: Palette.fontGrey,
                height: 13,
                width: 1,
              ),
              Texts("technology blog", color: Palette.fontGrey, fontSize: 13),
              Container(
                color: Palette.fontGrey,
                height: 13,
                width: 1,
              ),
              Texts("Review copyright", color: Palette.fontGrey, fontSize: 13),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                Icons.send,
                color: Palette.fontGrey,
                size: 12,
              ),
              Texts(
                "  review@logo.com",
                color: Palette.fontGrey,
                fontSize: 13,
              ),
              Spacer(),
              Container(
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Palette.fontGrey, width: 1.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: Icon(Icons.arrow_drop_down),
                    icon: SizedBox(),
                    items: dropdownItems.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Texts(
                          item,
                          fontSize: 12,
                          color: Palette.fontGrey,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth,
            height: 1,
            color: Palette.fontGrey.withOpacity(.3),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
          SizedBox(
            height: 20,
          ),
          Texts(
            "@2022-2022 LOGO Lab, Inc. (주)아무개  서울시 강남구",
            fontSize: 10,
            color: Palette.fontGrey,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class GoldLevelModel {
  String name;
  String imageUrl;

  GoldLevelModel({required this.name, required this.imageUrl});
}
