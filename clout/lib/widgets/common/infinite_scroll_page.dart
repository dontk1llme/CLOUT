import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

void main() {
  runApp(MyApp());
}

class YourData {
  final String title;

  YourData(this.title);
}

class YourDataRepository {
  static Future<List<YourData>> fetchData(int pageKey) async {
    // 데이터를 검색하고 반환하는 비동기 작업을 수행
    await Future.delayed(Duration(seconds: 2)); // 지연 시간(일부러 함)

    final List<YourData> data = List.generate(
      10, // 페이지당 아이템 수
      (index) => YourData('Item ${index + 1} on page $pageKey'),
    );

    return data;
  }
}

class InfiniteScrollPage extends StatefulWidget {
  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  final PagingController<int, YourData> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
  }

  Future<void> fetchData(int pageKey) async {
    try {
      final items = await YourDataRepository.fetchData(pageKey);
      final isLastPage = items.isEmpty;
      if (isLastPage) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, YourData>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<YourData>(
        itemBuilder: (context, item, index) {
          return ListTile(
            title: Text(item.title),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Infinite Scroll Pagination'),
        ),
        body: InfiniteScrollPage(),
      ),
    );
  }
}
