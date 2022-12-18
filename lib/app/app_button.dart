import 'package:flutter/material.dart';
import 'package:projectx/app/app_color.dart';

class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({
    Key? key,
    this.color,
    this.textColor,
    this.isIcon,
    this.iconColor,
    this.icon,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  Color? color;
  Color? iconColor;
  bool? isIcon;
  IconData? icon;
  Color? textColor;
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: SizedBox(
        child: Container(
          height: 65,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: color ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isIcon == true
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          icon,
                          size: 20,
                          color: iconColor,
                        ),
                      )
                    : Container(),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: textColor ?? AppColor.whiteColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
