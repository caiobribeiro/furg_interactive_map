import 'package:furg_interactive_map/models/phone_list_model.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
part 'furgPhoneListSearch_store.g.dart';

class FurgPhoneListSearchStore = _FurgPhoneListSearchStoreBase
    with _$FurgPhoneListSearchStore;

abstract class _FurgPhoneListSearchStoreBase with Store {
  @observable
  String searchPhoneListString = "";

  @action
  void setSearchTelListString(String value) => searchPhoneListString = value;

  @observable
  Response? response;

  @observable
  String responseString = "";

  @action
  Future<PhoneListApi> getPhoneSearch() async {
    print(searchPhoneListString);
    var dio = Dio();
    try {
      response = await dio.post(
          'https://api.furg.br/lista_telefonica/Publico/consultaTelefones',
          data: {
            "busca_telefone": searchPhoneListString,
            "limit": 21,
            "inicio": 0
          });
      responseString = response.toString();
      print(response);

      return PhoneListApi.fromJson(response!.data);
    } catch (e) {
      print(e);
    }
    throw 42;
  }
}
