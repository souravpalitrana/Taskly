import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:taskly/presentation/feature/home/provider/home_state_provider.dart';

class TaskFilter extends ConsumerWidget {
  TaskFilter({required this.filterItems, super.key});

  //final int selectedIndex;
  final List<String> filterItems;
  final ItemScrollController _scrollController = ItemScrollController();

  void scrollToItem(int index) {
    _scrollController.scrollTo(
        index: index,
        duration: const Duration(microseconds: 500),
        curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.read(homeState.notifier).selectedFilterIdx;
    _startScrollDelay(selectedIndex);
    print("Selected Index $selectedIndex");
    return ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
      itemCount: filterItems.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) =>
          _getFilterItemWidget(filterItems[index], index, ref),
    );
  }

  Widget _getFilterItemWidget(String item, int index, WidgetRef ref) {
    final isSelected = index == ref.read(homeState.notifier).selectedFilterIdx;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected
              ? const Color.fromARGB(255, 30, 88, 104)
              : const Color.fromARGB(155, 26, 60, 69),
          side: isSelected
              ? const BorderSide(color: Colors.white, width: 2)
              : null,
        ),
        onPressed: () {
          scrollToItem(index);
          ref.read(homeState.notifier).setFilter(index);
        },
        child: Text(
          item.toUpperCase(),
          style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 182, 178, 178),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600),
        ),
      ),
    );
  }

  void _startScrollDelay(int selectedIndex) {
    Future.delayed(const Duration(microseconds: 1000), () {
      scrollToItem(selectedIndex);
    });
  }
}
