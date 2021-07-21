import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Container(
            color: Colors.grey,
          ),
        ),
        Opacity(
          opacity: 1,
          child: Center(child: CircularProgressIndicator()),
        )
      ],
    );
  }
}
