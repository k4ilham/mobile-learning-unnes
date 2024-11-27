import '../core.dart';

class Mytext extends StatelessWidget {
  final String titleText;
  final TextStyle? titleStyle;
  final TextAlign textAlign;

  const Mytext({
    super.key,
    required this.titleText,
    this.titleStyle,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: textAlign,
      style: titleStyle ??
          const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
