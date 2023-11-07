import 'package:flutter/material.dart';
import 'package:clout/style.dart' as style;
import 'package:get/get.dart';

// widgets
import 'package:clout/widgets/common/choicechip.dart';
import 'package:clout/utilities/bouncing_listview.dart';
import 'package:clout/widgets/header/header.dart';
import 'package:clout/screens/contract/widgets/small_contract.dart';

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

  Contract contract = Contract();

  @override
  Widget build(BuildContext context) {
    Get.put(ContractInfiniteScrollController());
    return GetBuilder<ContractInfiniteScrollController>(
      builder: (controller) => Scaffold(
        backgroundColor: style.colors['white'],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Header(
            header: 4,
            headerTitle: '내 계약서 목록',
          ),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: BouncingListview(
            child: FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.9,
              child: Column(
                children: [
                  ActionChoiceExample(
                    labels: ['전체 내역', '서명 대기', '진행중', '계약 만료'],
                    chipCount: 4,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    controller: controller.scrollController.value,
                    itemBuilder: (_, index) {
                      if (index < controller.data.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: SmallContract(
                              name: controller.data[index].name,
                              pay: controller.data[index].pay,
                              progress: false),
                        );
                      }

                      if (controller.hasMore || controller.isLoading) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 40),
                          child: SizedBox(
                            height: 50,
                            child: Center(
                                child: LoadingIndicator(
                              indicatorType: Indicator.ballRotateChase,
                              colors: [
                                style.colors['main1-4']!,
                                style.colors['main1-3']!,
                                style.colors['main1-2']!,
                                style.colors['main1-1']!,
                                style.colors['main1']!,
                              ],
                            )),
                          ),
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('데이터의 마지막 입니다'),
                          IconButton(
                            onPressed: () {
                              controller.reload();
                            },
                            icon: Icon(Icons.refresh_outlined),
                          ),
                        ],
                      );
                    },
                    itemCount: controller.data.length + 1,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
