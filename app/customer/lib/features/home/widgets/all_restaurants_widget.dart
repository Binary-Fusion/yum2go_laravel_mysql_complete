import 'package:yum2go_v3_customer/common/models/restaurant_model.dart';
import 'package:yum2go_v3_customer/features/home/widgets/app/restaurant_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/restaurants_view_widget.dart';
import 'package:yum2go_v3_customer/features/restaurant/controllers/restaurant_controller.dart';
import 'package:yum2go_v3_customer/common/widgets/paginated_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllRestaurantsWidget extends StatelessWidget {
  final ScrollController scrollController;
  const AllRestaurantsWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(
      builder: (restaurantController) {
        return PaginatedListViewWidget(
          scrollController: scrollController,
          totalSize: restaurantController.restaurantModel?.totalSize,
          offset: restaurantController.restaurantModel?.offset,
          onPaginate: (int? offset) async =>
              await restaurantController.getRestaurantList(offset!, false),
          productView: RestaurantsViewWidget(
            isLoading:
                restaurantController.restaurantModel?.restaurants == null ||
                    restaurantController.localRestaurantList == null ||
                    restaurantController.nationalRestaurantList == null,
            restaurants: <Restaurant>{
              ...(restaurantController.nationalRestaurantList ?? []),
              ...(restaurantController.localRestaurantList ?? []),
              ...(restaurantController.restaurantModel?.restaurants ?? []),
            }.toList(),
          ),
        );
      },
    );
  }
}
