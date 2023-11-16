import 'dart:convert';

import 'package:clout/hooks/apis/authorized_api.dart';
import 'package:clout/type.dart';
import 'package:get/get.dart';

class ContractController extends GetxController {
  Contract? contractInfo;

  loadContractData(input) async {
    AuthorizedApi authorizedApi = AuthorizedApi();
    var response = await authorizedApi.getRequest(
        '/contract-service/v1/contracts/', input);
    print(response);
    final decodedResponse = jsonDecode(response['body']);
    contractInfo = Contract.fromJson(decodedResponse);
  }
}
