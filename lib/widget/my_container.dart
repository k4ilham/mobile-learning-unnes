import '../core.dart';

class MyContainer extends StatelessWidget {
  final List<Widget> children;
  final Color? containerColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry borderRadius;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const MyContainer(
      {super.key,
      required this.children,
      this.containerColor = Colors.white,
      this.margin = const EdgeInsets.all(16),
      this.padding = const EdgeInsets.all(16),
      this.borderRadius = const BorderRadius.all(Radius.circular(25)),
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
