import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:griya_rt_app/app/data/Models/warga_model.dart';
import 'package:griya_rt_app/app/modules/login/controllers/login_controller.dart';
import 'package:nb_utils/nb_utils.dart';

class WargaController extends GetxController {
  var isSaving = false.obs;

  RxList<UserModel> rxUsers = RxList<UserModel>();
  List<UserModel> get listuser => rxUsers.value;
  set listuser(List<UserModel> value) => rxUsers.value = value;

  RxList<WargaModel> rxWarga = RxList<WargaModel>();
  List<WargaModel> get listwarga => rxWarga.value;
  set listwarga(List<WargaModel> value) => rxWarga.value = value;

  Future approve(WargaModel warga) async {
    isSaving.value = true;
    warga.status = 'approve';
    try {
      await warga.save();
      toast('Data berhasil diperbarui');
      Get.back();
    } catch (e) {
      print(e);
      toast('Error ${e.toString()}');
    } finally {
      isSaving.value = false;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    rxUsers.bindStream(UserModel().allstreamList());
    rxWarga.bindStream(WargaModel().streamAllList());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
