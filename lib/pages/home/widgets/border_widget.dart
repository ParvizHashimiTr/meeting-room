import 'package:flutter/material.dart';

final borderAll = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(
        width: 5,
        color: Colors.white,
      ),
    );

    final errorBorder = borderAll.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );