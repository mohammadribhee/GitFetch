import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitfetch/service/github_repository.dart';
import '../../../controller/repository_controller.dart';
import '../../../helper/dialog_helper.dart';
import '../../widget/Indicator/indicator.dart';
import '../../widget/home/reload_button.dart';
import '../../widget/home/repository_list.dart';
import '../../widget/home/search_field.dart';

// Import the widgets

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<dynamic> data = [];
  List<dynamic> searchData = []; // Store the initial data separately
  final GitHubRepository _repository = GitHubRepository();
  final RepositoryController controller = Get.put(RepositoryController());

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData("Q");
  }

  Future<void> fetchData(String searchQuery) async {
    setState(() {
      isLoading = true; // Set isLoading to true when fetching data starts
    });
    try {
      final fetchedData = await _repository.fetchData(searchQuery);
      setState(() {
        data = fetchedData;
        searchData = List.from(data);
        // Initialize searchData with fetched items
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Set isLoading to false in case of error
      });
      // Handle network errors
      showErrorDialog(context);
    }
  }

  void filterData(String searchQuery) {
    setState(() {
      // Filter data based on searchQuery
      searchData = data
          .where((item) =>
              item['name']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              item['description']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              item['owner']['login']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Repositories', // Set text color to white
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? const LoadingIndicator()
            : Column(
                children: [
                  SearchField(
                    searchController: controller.searchController,
                    onChanged: filterData,
                  ),
                  Expanded(
                    child: RepositoryList(searchData: searchData),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: ReloadButton(
        isLoading: isLoading,
        onPressed: () => fetchData("Q"),
      ),
    );
  }
}
