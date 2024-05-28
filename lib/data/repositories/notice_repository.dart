import 'dart:convert';
import 'package:blood_bank/data/http/exceptions.dart';
import 'package:blood_bank/data/http/http_client.dart';
import 'package:blood_bank/data/models/Notice.dart';

abstract class INoticeRepository {
  Future<List<Notice>> getNotices({int? city_id, int? hemocentre_id});
}

class NoticeRepository implements INoticeRepository {
  final IHttpClient client;

  NoticeRepository({required this.client});

  @override
  Future<List<Notice>> getNotices({int? city_id, int? hemocentre_id}) async {
    print('TESTE 1');

    final response = (city_id != null || hemocentre_id != null)
        ? await client.get(
            address: "news?city_id=$city_id&hemocentre_id=$hemocentre_id")
        : await client.get(address: "news");
    print('TESTE 2');

    print('RESPONSE: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List<Notice> notices = [];

      final body = jsonDecode(response.body);

      body.map((item) {
        final Notice notice = Notice.fromMap(item);
        notices.add(notice);
      }).toList();
      return notices;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A url informada não e valida!");
    } else if (response.statusCode == 405) {
      throw NotFoundException("Sem autorização");
    } else {
      throw Exception("não foi possivel carregar os Funcionarios");
    }
  }
}
