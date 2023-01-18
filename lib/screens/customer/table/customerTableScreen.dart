import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../models/customerModel.dart';
import '../../../controllers/customerController.dart';

import '../../../widgets/application_app_bar.dart';
import 'package:get/get.dart';
import '../../../widgets/paginated_table_cell.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomerTableScreen extends StatefulWidget {
  const CustomerTableScreen({super.key});

  @override
  State<CustomerTableScreen> createState() => _CustomerTableScreenState();
}

class _CustomerTableScreenState extends State<CustomerTableScreen> {
  final customerController = Get.find<CustomerController>();

  static const _pageSize = 10;

  final PagingController<int, CustomerModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int offset) async {
    try {
      final newItems =
          await customerController.fetchList(offset: offset, limit: _pageSize);
      final isLastPage = newItems.rows.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.rows);
      } else {
        final nextOffset = offset + newItems.rows.length;
        _pagingController.appendPage(newItems.rows, nextOffset);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(
        context: context,
        appBarTitle: 'Customer',
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () async {
              await Get.toNamed('/customerForm');
              _pagingController.refresh();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/background.png'),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PaginatedTableCell(
                        text: "Action",
                        width: 100,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                      PaginatedTableCell(
                        text: "City",
                        width: 250,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                      PaginatedTableCell(
                        text: "Market",
                        width: 250,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                      PaginatedTableCell(
                        text: "Name",
                        width: 250,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                      PaginatedTableCell(
                        text: "Address",
                        width: 250,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                      PaginatedTableCell(
                        text: "Tapri",
                        width: 250,
                        fontSize: 20,
                        textColor: Colors.black,
                        bgColor: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    height: 0.8.sh,
                    width: 100 + (250 * 5),
                    child: PagedListView<int, CustomerModel>(
                      shrinkWrap: false,
                      scrollDirection: Axis.vertical,
                      // physics: NeverScrollableScrollPhysics(),
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<CustomerModel>(
                          noItemsFoundIndicatorBuilder: (context) => Container(
                                height: 0.8.sh,
                                width: 1.sw,
                                alignment: Alignment.center,
                                child: Text(
                                  'No data',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                          itemBuilder: (context, item, index) => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await Get.toNamed('/customerForm',
                                          arguments: {"id": item.id ?? ""});
                                      _pagingController.refresh();
                                    },
                                    child: PaginatedTableCell(
                                      text: "Edit",
                                      width: 100,
                                      fontSize: 16,
                                      textColor: Colors.white,
                                      bgColor: Colors.transparent,
                                    ),
                                  ),
                                  PaginatedTableCell(
                                    child: Text("city"),
                                    width: 250,
                                    fontSize: 18,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                  PaginatedTableCell(
                                    child: Text("market"),
                                    width: 250,
                                    fontSize: 18,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                  PaginatedTableCell(
                                    text: "${item.name}",
                                    width: 250,
                                    fontSize: 18,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                  PaginatedTableCell(
                                    text: "${item.address}",
                                    width: 250,
                                    fontSize: 18,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                  PaginatedTableCell(
                                    child: Text("tapri"),
                                    width: 250,
                                    fontSize: 18,
                                    textColor: Colors.white,
                                    bgColor: Colors.transparent,
                                  ),
                                ],
                              )),
                      //  ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
