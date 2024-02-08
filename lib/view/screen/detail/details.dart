import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/dialog_helper.dart';
import '../../../service/github_repository.dart';
import '../../widget/Indicator/indicator.dart';
import '../../widget/detail/list_card_branches.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  List<dynamic> detailsData = [];
  final GitHubRepository _repository = GitHubRepository();

  @override
  void initState() {
    super.initState();
    fetchDataBranches(Get.arguments);
  }

  Future<void> fetchDataBranches(String branchesURL) async {
    try {
      final fetchedData = await _repository.fetchDataDetails(branchesURL);
      setState(() {
        detailsData = fetchedData;
      });
    } catch (e) {
      // Handle network errors
      showErrorDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Branches'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (detailsData.isEmpty) {
      return const LoadingIndicator();
    } else {
      return ListCardBranches(
          detailsData: detailsData.cast<Map<String, dynamic>>());
    }
  }
}
