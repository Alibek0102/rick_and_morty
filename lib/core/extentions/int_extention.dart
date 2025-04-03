import 'package:flutter/material.dart';

extension MyInt on int {
  get width {
    return SizedBox(
      width: this.toDouble(),
    );
  }

  get height {
    return SizedBox(height: this.toDouble());
  }
}
