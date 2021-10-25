import 'package:flutter/material.dart';
import 'package:kozarni_ecome/data/constant.dart';

class HomePickUp extends StatelessWidget {
  const HomePickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 245,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 20, top: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, i) => Container(
          margin: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width - 40,
          height: 210,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 20,
                child: SizedBox(
                  // width: 40,
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: index == i ? homeIndicatorColor : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
