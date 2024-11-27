import '../core.dart';

class CourseDetail extends StatefulWidget {
  final Map<String, dynamic> listData;
  const CourseDetail({
    super.key,
    required this.listData,
  });

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late List<dynamic> _filteredData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = widget.listData['chapter'] as List<dynamic>? ?? [];
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
              : CourseDetailBodySection(filteredData: _filteredData),
          const BottomNav(),
        ],
      ),
    );
  }
}

class CourseDetailBodySection extends StatelessWidget {
  const CourseDetailBodySection({
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

          IconData leadingIcon;
          if (item['type'] == 'youtube') {
            leadingIcon = Icons.video_library;
          } else if (item['type'] == 'pdf') {
            leadingIcon = Icons.picture_as_pdf;
          } else {
            leadingIcon = Icons.book;
          }
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListTile(
              onTap: () {
                Get.to(CourseVideo(listData: item));
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Icon(
                leadingIcon,
                color: primaryColor,
                size: 40,
              ),
              title: Text(item['title'] ?? 'No Title'),
              // subtitle: Text(item['description'] ?? 'No description'),
            ),
          );
        },
      ),
    );
  }
}
