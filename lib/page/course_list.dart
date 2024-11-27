import '../core.dart';

class CourseList extends StatefulWidget {
  final Map<String, dynamic> listData;
  const CourseList({
    super.key,
    required this.listData,
  });

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  late List<dynamic> _filteredData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = widget.listData['course'] as List<dynamic>? ?? [];
      setState(() {
        _filteredData = data;
      });
    } catch (error) {
      // ignore: avoid_print
      print('failed to load data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          MyHeader(
            titleText: widget.listData['title'],
            subtitleText: widget.listData['description'],
            showSearch: false,
            showBackButton: true,
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
              : BodySection(filteredData: _filteredData),
          const BottomNav(),
        ],
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({
    super.key,
    required List filteredData,
  }) : _filteredData = filteredData;

  final List _filteredData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredData.length,
        itemBuilder: (context, index) {
          final item = _filteredData[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Image.asset(imageSplash),
              title: Text(item['title'] ?? 'No Title'),
              subtitle: Text(item['description'] ?? 'No description'),
            ),
          );
        },
      ),
    );
  }
}
