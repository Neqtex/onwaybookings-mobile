// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'article_item_model.dart';

/// This class defines the variables used in the [article_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArticleModel extends Equatable {
  ArticleModel({this.articleItemList = const []});

  List<ArticleItemModel> articleItemList;

  ArticleModel copyWith({List<ArticleItemModel>? articleItemList}) {
    return ArticleModel(
      articleItemList: articleItemList ?? this.articleItemList,
    );
  }

  @override
  List<Object?> get props => [articleItemList];
}
