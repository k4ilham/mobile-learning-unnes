import 'package:myapp/widget/my_card.dart';

import '../core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredData = [];
  List<dynamic> _originalData = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final response = await rootBundle.loadString('assets/database.json');
      final data = await json.decode(response) as List<dynamic>;
      setState(() {
        _originalData = data;
        _filteredData = data;
      });
    } catch (error) {
      // ignore: avoid_print
      print('failed to load JSON data: $error');
    }
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = query.isEmpty || query.length < 3
          ? _originalData
          : _originalData.where((item) {
              final title = item['title'].toString().toLowerCase();
              final description = item['description '].toString().toLowerCase();
              final searcQuery = query.toLowerCase();
              return title.contains(searcQuery) ||
                  description.contains(searcQuery);
            }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          MyHeader(
            titleText: 'Mobile Learning',
            subtitleText: 'Universitas Negeri Semarang',
            showSearch: true,
            showBackButton: false,
            searchController: _searchController,
            onSearchChanged: _filterData,
          ),
          const SizedBox(
            height: 10,
          ),
          _filteredData.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('No Data Available'),
                  ),
                )
              : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    itemCount: _filteredData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      final item = _filteredData[index];
                      return GestureDetector(
                        onTap: () {},
                        child: MyCard(
                          title: item['title'],
                          description: item['description'] ?? '0 Course',
                          imagePath: item['image'],
                        ),
                      );
                    },
                  ),
                )),
          const BottomNav(),
        ],
      ),
    );
  }
}
