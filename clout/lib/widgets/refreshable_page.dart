import 'package:flutter/material.dart';

class RefreshablePage extends StatelessWidget {
  RefreshablePage({super.key, required this.controller, required this.child});
  ScrollController
      controller; // 사용하는 controller 내부에 정의된 ScrollController를 인자로 받아야 함 나머지 설정은 controller에서 할것
  Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: SizedBox(
                  height: screenHeight - 90,
                  child: child,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
