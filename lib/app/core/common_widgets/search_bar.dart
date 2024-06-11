// import 'package:apponvi/app/data/repository/auth_repo/auth_repository.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

// import '../../routes/app_pages.dart';
import '../values/s_spacing.dart';
import 'search_view.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // onTap: (() => Get.toNamed(Routes.SEARCH)),
      // {showSearch(context: context, delegate: CustomSearchDelegate())}),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Get.theme.colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              FluentSystemIcons.ic_fluent_search_regular,
            ),
            SSpacing.smW,
            Text(
              'Search here...',
              style: Get.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //  var bData = Provider.of<BookData>(context, listen: false);
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => SearchView(query);

  // @override
  // Widget buildResults(BuildContext context) {
  //   throw UnimplementedError();
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Visibility(
                  visible: /* AuthRepository.instance.suggestions.isNotEmpty */
                      false.obs.value,
                  child: Text(
                    'Recently searched',
                    style: Get.textTheme.titleSmall,
                  ),
                )),
            const SizedBox(
              height: 6,
            ),

            Obx(
              () => Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  for (var item
                      // ignore: invalid_use_of_protected_member
                      in /* AuthRepository.instance.suggestions */ [].obs.value)
                    Container(
                      clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Get.theme.colorScheme.primaryContainer),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              query = item;

                              showResults(context);
                            },
                            child: Text(
                              item,
                              style: Get.textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                              // iconSize: 12,
                              onTap: () {
                                /* AuthRepository.instance.suggestions */ []
                                    .remove(item);
                              },
                              child: const Icon(
                                FluentSystemIcons.ic_fluent_contacts_regular,
                                size: 12,
                              ))
                        ],
                      ),
                    )
                ],
              ),
            ),

            // const Text('Search by popular Services'),
            // const SizedBox(height: 6),
            // GridView.builder(
            //   itemCount: suggestions.length,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     final suggestion = suggestions[index];

            //     return TextButton(
            //       style: TextButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(4),
            //             side: BorderSide(color: Get.theme.colorScheme.outline)),
            //       ),
            //       onPressed: () {
            //         query = suggestion;
            //         showResults(context);
            //       },
            //       child: Text(suggestion),
            //     );
            //   },
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       crossAxisSpacing: 4,
            //       mainAxisSpacing: 4,
            //       childAspectRatio: 2.3),
            // ),
          ],
        ),
      ),
    );
  }
}
