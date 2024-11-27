
import '../core.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: ImageSection(),
          ),
          Expanded(
            flex: 2,
            child: BodySection(),
          ),
        ],
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Mytext(
          titleText: 'Mobile learning\nUniversitas Negeri Semarang',
          titleStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        const Mytext(
          titleText:
              'Temukan keterampilan baru\nbelajar kapan saja, dimana saja',
          titleStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          buttonText: 'Mulai Belajar',
          buttonColor: primaryColor,
          textColor: whiteColor,
          onPress: () {
            Get.to(const Home());
          },
        )
      ],
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageSplash,
      fit: BoxFit.contain,
    );
  }
}
