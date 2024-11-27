import '../core.dart';

class MyHeader extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final bool showSearch;
  final bool showBackButton;
  final TextEditingController? searchController;
  final Function(String)? onSearchChanged;

  const MyHeader({
    super.key,
    required this.titleText,
    this.subtitleText = '',
    this.showSearch = false,
    this.showBackButton = false,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      containerColor: primaryColor,
      margin: const EdgeInsets.all(0),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            if (showBackButton)
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Mytext(
                    titleText: titleText,
                    titleStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  if (subtitleText.isNotEmpty)
                    Mytext(
                      titleText: subtitleText,
                      titleStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: whiteColor,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        if (showSearch && searchController != null && onSearchChanged != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                  hintText: 'Mau belajar apa hari ini',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                  )),
            ),
          )
      ],
    );
  }
}
