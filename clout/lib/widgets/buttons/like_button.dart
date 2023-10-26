import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final VoidCallback onTap;

  LikeButton({required this.isLiked, required this.onTap});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color:
              isLiked ? Colors.red : const Color.fromARGB(255, 225, 225, 225),
          size: 25,
        ),
      ),
    );
  }
}
