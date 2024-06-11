// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import '../../data/repository/auth_repo/auth_repository.dart';

import '../values/s_image_strings.dart';
import 'empty_widget.dart';

class SearchView extends GetView {
  final String query;
  const SearchView(this.query, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (query.isNotEmpty) {
    //   if (AuthRepository.instance.suggestions.value.contains(query)) {
    //     AuthRepository.instance.suggestions.value.remove(query);
    //   }
    //   if (AuthRepository.instance.suggestions.length >= 5) {
    //     AuthRepository.instance.suggestions.value.removeLast();
    //   }
    //   AuthRepository.instance.suggestions.value.insert(0, query);
    // }
    // controller.getOutletListBySearch(query);

    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Expanded(child: OutletListWidget(list: controller.outletList)),
          Center(
              child: EmptyWidget(
            frontImageString: SImageAssets.noActivity,
          ))
        ],
      ),
    );
  }
}
