import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*const Text(
                "Hi, Where are you\ngoing now ?",
                style: TextStyle(
                  fontSize: 30, //30              // For Displaying text on
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),*/

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  //use expended if you are using textformfield in row
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30), //50
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5, //10
                                spreadRadius: 1, //3
                                offset: const Offset(5, 5))
                          ]),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5.0, //10.0
                                spreadRadius: 3,
                                offset: const Offset(2, 2)) //5,5
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.sort,
                          size: 20, //26
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}