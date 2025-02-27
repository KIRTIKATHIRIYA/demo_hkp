import 'package:flutter/material.dart';
import 'package:hyperhire_assingment/widgets/widgets.dart';

import '../utils/utils.dart';

class ProductDetail extends StatefulWidget {
  /// TODO: In dynamic situation data will pass from below screen using constructor
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  String? selectedValue; // ✅ Variable to store selected item
  final List<String> dropdownItems = ["Option 1", "Option 2", "Option 3"];
  int _rating = 3; // it will be set as per product

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // Back icon
            onPressed: () {
              Navigator.pop(context); // Go back to previous screen
            },
          ),
          title: Center(
            child: Texts(
              'Best Review',
              fontSize: 16,
              fontFamily: medium,
              textAlign: TextAlign.center,
              color: Colors.white,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topView(),bodyDetail(),bottomDetail(),
        ],
      ),
    );
  }

  Widget topView() {
    return Container(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(bottom: 6,top: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey, // Background color
            ),
            child: ClipOval( // ✅ Ensures circular clipping
              child: Image.asset(
                'assets/images/placeholder.png',
                fit: BoxFit.cover, // ✅ Ensures image fills the circle properly
              ),
            ),
          ),
          Texts(
            'Name1',
            fontSize: 20,
            fontFamily: medium,
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                color: Palette.accentLight,
                borderRadius: BorderRadius.circular(5)),
            child: Texts(
              'Hello this is testing description',
              fontSize: 12,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: screenWidth,
            height: 6,
            color: Palette.accentLight,
          ),

        ],
      ),
    );
  }

  Widget bodyDetail(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total ',
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                    TextSpan(
                      text: '14 reviews!',
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30, // Adjust height for better UI
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 1.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select", // Default hint text
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.grey), // Dropdown icon before selection
                      ],
                    ),
                    icon: SizedBox(), // Hide default dropdown icon
                    items: dropdownItems.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item, style: TextStyle(fontSize: 12, color: Colors.black)),
                            if (selectedValue == item) Icon(Icons.arrow_drop_down, color: Colors.grey), // ✅ Checkmark for selected item
                          ],
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
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Palette.accentLight)),
                margin: const EdgeInsets.only(right: 10),
                width: 104,
                height: 104,
                child: Image.asset('assets/images/placeholder.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts(
                   'product name 1',
                    fontSize: 14,
                    fontFamily: semiBold,
                    textAlign: TextAlign.center,
                  ),SizedBox(height: 5,),
                  Texts(
                   'product description',
                    fontSize: 12,
                    fontFamily: medium,
                    textAlign: TextAlign.center,
                  ),SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = index + 1;
                              });
                            },
                            child: Icon(
                              Icons.star,
                              size: 20,
                              color: index < _rating ? Colors.amber : Colors.grey,
                            ),
                          );
                        }),
                      ),SizedBox(width: 3,),
                      Texts('4.56',
                        fontSize: 18,
                        fontFamily: medium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                ],
              )
            ],
          ),          SizedBox(height: 10,),

          Divider(color: Palette.accentLight,)
        ],
      ),
    );
  }

  Widget bottomDetail(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 34,
                    width: 34,
                    margin: EdgeInsets.only(bottom: 6,right: 6),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey
                      // image: DecorationImage(
                      //     fit: BoxFit.cover,
                      //     // Ensures image fills the circle
                      //
                      //     image: NetworkImage(
                      //       goldLevelList[index].imageUrl,
                      //     )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texts(
                        'product 123',
                        fontSize: 14,
                        fontFamily: medium,
                        textAlign: TextAlign.center,
                      ),SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rating = index + 1;
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  size: 10,
                                  color: index < _rating ? Colors.amber : Colors.grey,
                                ),
                              );
                            }),
                          ),SizedBox(width: 3,),
                          Texts('14:25:2032',
                            fontSize: 10,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
              Icon(Icons.save,color: Palette.fontGrey,)
            ],
          )
        ],
      ),
    );
  }
}
