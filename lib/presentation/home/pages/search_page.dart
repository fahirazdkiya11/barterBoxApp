import 'package:barterboxapp/core/components/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item/item_bloc.dart';
import '../widget/item_card.dart';
import '../widget/item_empty.dart';

class SearchPageState extends StatefulWidget {
  const SearchPageState({super.key});

  @override
  State<SearchPageState> createState() => _SearchPageStateState();
}

class _SearchPageStateState extends State<SearchPageState> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Trading with",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "BarterBox",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/user.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            color: const Color(0xFFFF2F08),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: SearchInput(
                controller: searchController,
                onChanged: (value) {
                  if (value.length >= 1) {
                    context.read<ItemBloc>().add(ItemEvent.searchItem(value));
                  }

                  if (value.isEmpty) {
                    context
                        .read<ItemBloc>()
                        .add(const ItemEvent.fetchAllFromState());
                  }
                },
              ),
            ),

            // Items Widget
            BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox();
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (message) {
                    return Center(
                      child: Text(message),
                    );
                  },
                  success: (items) {
                    if (items.isEmpty) return const ItemEmpty();
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.75,
                        crossAxisCount: 2,
                        // crossAxisSpacing: 5.0,
                        // mainAxisSpacing: 5.0,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                        data: items[index],
                        onCartButton: () {},
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//                 width: MediaQuery.of(context).size.width / 1.1,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF3F3F3),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: "Search your food here ...",
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//               ),