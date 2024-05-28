import 'package:blood_bank/data/http/exceptions.dart';
import 'package:blood_bank/data/models/Notice.dart';
import 'package:blood_bank/data/repositories/notice_repository.dart';
import 'package:flutter/material.dart';

class NoticeStore {
  final INoticeRepository repository;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<Notice>> state =
      ValueNotifier<List<Notice>>([]);
  final ValueNotifier<String> erro = ValueNotifier<String>("");

  NoticeStore({required this.repository});

  Future getNotices() async {
    isLoading.value = true;
    try {
      final result = await repository.getNotices(city_id: 2);
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
    return state.value;
  }
}
