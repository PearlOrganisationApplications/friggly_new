import 'package:flutter/material.dart';
import 'package:friggly/app/constants/appcolors.dart';

Widget buildPage({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
}) =>
    Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              urlImage,
            ),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.blackPearl,
            ),
          ),
        ],
      ),
    );
