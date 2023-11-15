import 'package:clout/widgets/loading_indicator.dart';
import 'package:clout/widgets/refreshable_page.dart';
import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/common/choicechip.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/contract_list/widgets/small_contract.dart';

// controllers
import 'package:clout/providers/scroll_controllers/contract_infinite_scroll_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

// class Contract {
//   int contractId = 1;
//   String name = '못골영농조합법인';
//   String pay = '1,000 포인트'; // 포인트 또는 제공물품
// }

class ContractList extends GetView<ContractInfiniteScrollController> {
  ContractList({super.key});

  var contractId = Get.arguments;

  final contractController = Get.put(ContractInfiniteScrollController());

  @override
  Widget build(BuildContext context) {
    contractController.reload();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: style.colors['white'],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(
          header: 4,
          headerTitle: '내 계약서 목록',
        ),
      ),
      body: GetBuilder<ContractInfiniteScrollController>(
        builder: (controller) => RefreshablePage(
          controller: controller.scrollController.value,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: BouncingListview(
              child: FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.9,
                child: !controller.isLoading
                    ? Column(
                        children: [
                          ActionChoiceExample(
                            labels: ['전체 내역', '서명 대기', '진행중', '계약 만료'],
                            chipCount: 4,
                            onChipSelected: (label) {},
                          ),
                          Column(children: controller.data),
                          controller.hasMore && controller.dataLoading
                              ? Column(
                                  children: [
                                    SizedBox(height: 50),
                                    SizedBox(
                                        height: 70,
                                        child: Center(child: LoadingWidget())),
                                  ],
                                )
                              : SizedBox(height: 30),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: screenHeight / 3),
                          SizedBox(
                              height: 70,
                              child: Center(child: LoadingWidget())),
                          SizedBox(height: 20),
                          Text(
                            '계약서를 불러오는 중입니다.\n잠시만 기다려 주세요.',
                            style: style.textTheme.headlineLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
