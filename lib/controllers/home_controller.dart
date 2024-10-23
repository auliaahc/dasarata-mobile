import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/home/response_home_model.dart';
import 'package:dasarata_mobile/services/home_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoadingHome = RxBool(false);
  HomeService homeService = HomeService();
  Rxn<Data> homeData = Rxn<Data>();
  Rxn<List<GrowthProspect>> prospectStatisticts = Rxn<List<GrowthProspect>>();
  Rxn<List<GrowthClosing>> closingStatisticts = Rxn<List<GrowthClosing>>();

  @override
  void onReady() {
    super.onReady();
    getHomeData();
  }

  void setStatistictsData() {
    prospectStatisticts.value = homeData.value!.growthProspect;
    closingStatisticts.value = homeData.value!.growthClosing;
  }

  Future<void> getHomeData() async {
    isLoadingHome.value = true;
    try {
      final response = await homeService.getHomeData();
      homeData.value = response.data?.data;
    } catch (e) {
      if (e is ResponseHomeModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      setStatistictsData();
      isLoadingHome.value = false;
    }
  }
}
