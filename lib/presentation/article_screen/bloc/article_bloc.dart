import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/article_item_model.dart';
import 'package:chike_s_application/presentation/article_screen/models/article_model.dart';
part 'article_event.dart';
part 'article_state.dart';

/// A bloc that manages the state of a Article according to the event that is dispatched to it.
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(ArticleState initialState) : super(initialState) {
    on<ArticleInitialEvent>(_onInitialize);
  }

  List<ArticleItemModel> fillArticleItemList() {
    return List.generate(2, (index) => ArticleItemModel());
  }

  _onInitialize(
    ArticleInitialEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        articleModelObj: state.articleModelObj
            ?.copyWith(articleItemList: fillArticleItemList())));
  }
}
