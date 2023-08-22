// To parse this JSON data, do
//
//     final favouriteItemsModel = favouriteItemsModelFromJson(jsonString);

import 'dart:convert';

FavouriteItemsModel favouriteItemsModelFromJson(String str) => FavouriteItemsModel.fromJson(json.decode(str));

String favouriteItemsModelToJson(FavouriteItemsModel data) => json.encode(data.toJson());

class FavouriteItemsModel {
  List<ListElement>? lists;
  Meta? meta;

  FavouriteItemsModel({
    this.lists,
    this.meta,
  });

  factory FavouriteItemsModel.fromJson(Map<String, dynamic> json) => FavouriteItemsModel(
    lists: json["lists"] == null ? [] : List<ListElement>.from(json["lists"]!.map((x) => ListElement.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "lists": lists == null ? [] : List<dynamic>.from(lists!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class ListElement {
  ListUserData? userData;
  String? id;
  String? title;
  String? description;
  String? source;
  ListStats? stats;
  Share? share;
  Configuration? configuration;
  String? headline;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<List<dynamic>>? itemTags;
  List<String>? itemTagsByAlpha;
  Owner? owner;
  List<dynamic>? curators;

  ListElement({
    this.userData,
    this.id,
    this.title,
    this.description,
    this.source,
    this.stats,
    this.share,
    this.configuration,
    this.headline,
    this.createdAt,
    this.updatedAt,
    this.itemTags,
    this.itemTagsByAlpha,
    this.owner,
    this.curators,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    userData: json["user_data"] == null ? null : ListUserData.fromJson(json["user_data"]),
    id: json["id"],
    title: json["title"],
    description: json["description"],
    source: json["source"],
    stats: json["stats"] == null ? null : ListStats.fromJson(json["stats"]),
    share: json["share"] == null ? null : Share.fromJson(json["share"]),
    configuration: json["configuration"] == null ? null : Configuration.fromJson(json["configuration"]),
    headline: json["headline"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    itemTags: json["item_tags"] == null ? [] : List<List<dynamic>>.from(json["item_tags"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    itemTagsByAlpha: json["item_tags_by_alpha"] == null ? [] : List<String>.from(json["item_tags_by_alpha"]!.map((x) => x)),
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    curators: json["curators"] == null ? [] : List<dynamic>.from(json["curators"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "user_data": userData?.toJson(),
    "id": id,
    "title": title,
    "description": description,
    "source": source,
    "stats": stats?.toJson(),
    "share": share?.toJson(),
    "configuration": configuration?.toJson(),
    "headline": headline,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "item_tags": itemTags == null ? [] : List<dynamic>.from(itemTags!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "item_tags_by_alpha": itemTagsByAlpha == null ? [] : List<dynamic>.from(itemTagsByAlpha!.map((x) => x)),
    "owner": owner?.toJson(),
    "curators": curators == null ? [] : List<dynamic>.from(curators!.map((x) => x)),
  };
}

class Configuration {
  bool? isModerated;
  bool? isPrivate;
  bool? userCanAdd;
  bool? userCanComment;
  bool? userCanSeeQueue;
  bool? userCanVote;
  bool? anonymousCanVote;
  bool? votingClosed;
  bool? itemTimestamp;
  bool? emojiVoting;
  DefaultSort? defaultSort;
  DefaultLayout? defaultLayout;

  Configuration({
    this.isModerated,
    this.isPrivate,
    this.userCanAdd,
    this.userCanComment,
    this.userCanSeeQueue,
    this.userCanVote,
    this.anonymousCanVote,
    this.votingClosed,
    this.itemTimestamp,
    this.emojiVoting,
    this.defaultSort,
    this.defaultLayout,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
    isModerated: json["isModerated"],
    isPrivate: json["isPrivate"],
    userCanAdd: json["userCanAdd"],
    userCanComment: json["userCanComment"],
    userCanSeeQueue: json["userCanSeeQueue"],
    userCanVote: json["userCanVote"],
    anonymousCanVote: json["anonymousCanVote"],
    votingClosed: json["votingClosed"],
    itemTimestamp: json["itemTimestamp"],
    emojiVoting: json["emojiVoting"],
    defaultSort: defaultSortValues.map[json["defaultSort"]]!,
    defaultLayout: defaultLayoutValues.map[json["defaultLayout"]]!,
  );

  Map<String, dynamic> toJson() => {
    "isModerated": isModerated,
    "isPrivate": isPrivate,
    "userCanAdd": userCanAdd,
    "userCanComment": userCanComment,
    "userCanSeeQueue": userCanSeeQueue,
    "userCanVote": userCanVote,
    "anonymousCanVote": anonymousCanVote,
    "votingClosed": votingClosed,
    "itemTimestamp": itemTimestamp,
    "emojiVoting": emojiVoting,
    "defaultSort": defaultSortValues.reverse[defaultSort],
    "defaultLayout": defaultLayoutValues.reverse[defaultLayout],
  };
}

enum DefaultLayout {
  FULL,
  MAGAZINE
}

final defaultLayoutValues = EnumValues({
  "full": DefaultLayout.FULL,
  "magazine": DefaultLayout.MAGAZINE
});

enum DefaultSort {
  CROWDRANK
}

final defaultSortValues = EnumValues({
  "crowdrank": DefaultSort.CROWDRANK
});

class Owner {
  OwnerUserData? userData;
  int? id;
  String? name;
  String? screenName;
  String? profileImage;
  OwnerStats? stats;
  String? bio;
  Status? status;
  String? headline;

  Owner({
    this.userData,
    this.id,
    this.name,
    this.screenName,
    this.profileImage,
    this.stats,
    this.bio,
    this.status,
    this.headline,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    userData: json["user_data"] == null ? null : OwnerUserData.fromJson(json["user_data"]),
    id: json["id"],
    name: json["name"],
    screenName: json["screen_name"],
    profileImage: json["profile_image"],
    stats: json["stats"] == null ? null : OwnerStats.fromJson(json["stats"]),
    bio: json["bio"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    headline: json["headline"],
  );

  Map<String, dynamic> toJson() => {
    "user_data": userData?.toJson(),
    "id": id,
    "name": name,
    "screen_name": screenName,
    "profile_image": profileImage,
    "stats": stats?.toJson(),
    "bio": bio,
    "status": status?.toJson(),
    "headline": headline,
  };
}

class OwnerStats {
  int? listCount;
  int? followerCount;
  int? followingCount;
  int? helperCount;
  int? embedCount;
  int? viewCount;
  int? listSeenCount;

  OwnerStats({
    this.listCount,
    this.followerCount,
    this.followingCount,
    this.helperCount,
    this.embedCount,
    this.viewCount,
    this.listSeenCount,
  });

  factory OwnerStats.fromJson(Map<String, dynamic> json) => OwnerStats(
    listCount: json["listCount"],
    followerCount: json["followerCount"],
    followingCount: json["followingCount"],
    helperCount: json["helperCount"],
    embedCount: json["embedCount"],
    viewCount: json["viewCount"],
    listSeenCount: json["listSeenCount"],
  );

  Map<String, dynamic> toJson() => {
    "listCount": listCount,
    "followerCount": followerCount,
    "followingCount": followingCount,
    "helperCount": helperCount,
    "embedCount": embedCount,
    "viewCount": viewCount,
    "listSeenCount": listSeenCount,
  };
}

class Status {
  bool? isCurator;
  bool? hasPro;

  Status({
    this.isCurator,
    this.hasPro,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    isCurator: json["isCurator"],
    hasPro: json["hasPro"],
  );

  Map<String, dynamic> toJson() => {
    "isCurator": isCurator,
    "hasPro": hasPro,
  };
}

class OwnerUserData {
  bool? userIsMe;
  bool? followedByMe;

  OwnerUserData({
    this.userIsMe,
    this.followedByMe,
  });

  factory OwnerUserData.fromJson(Map<String, dynamic> json) => OwnerUserData(
    userIsMe: json["userIsMe"],
    followedByMe: json["followedByMe"],
  );

  Map<String, dynamic> toJson() => {
    "userIsMe": userIsMe,
    "followedByMe": followedByMe,
  };
}

class Share {
  String? shareTitle;
  String? shareSource;
  String? shareDescription;
  String? image;
  String? shareUrl;

  Share({
    this.shareTitle,
    this.shareSource,
    this.shareDescription,
    this.image,
    this.shareUrl,
  });

  factory Share.fromJson(Map<String, dynamic> json) => Share(
    shareTitle: json["shareTitle"],
    shareSource: json["shareSource"],
    shareDescription: json["shareDescription"],
    image: json["image"],
    shareUrl: json["shareURL"],
  );

  Map<String, dynamic> toJson() => {
    "shareTitle": shareTitle,
    "shareSource": shareSource,
    "shareDescription": shareDescription,
    "image": image,
    "shareURL": shareUrl,
  };
}

class ListStats {
  int? views;
  int? helperCount;
  int? publishedItemCount;
  int? queuedItemCount;
  int? followerCount;
  int? favoritesCount;
  double? totalVotes;

  ListStats({
    this.views,
    this.helperCount,
    this.publishedItemCount,
    this.queuedItemCount,
    this.followerCount,
    this.favoritesCount,
    this.totalVotes,
  });

  factory ListStats.fromJson(Map<String, dynamic> json) => ListStats(
    views: json["views"],
    helperCount: json["helperCount"],
    publishedItemCount: json["publishedItemCount"],
    queuedItemCount: json["queuedItemCount"],
    followerCount: json["followerCount"],
    favoritesCount: json["favoritesCount"],
    totalVotes: json["totalVotes"],
  );

  Map<String, dynamic> toJson() => {
    "views": views,
    "helperCount": helperCount,
    "publishedItemCount": publishedItemCount,
    "queuedItemCount": queuedItemCount,
    "followerCount": followerCount,
    "favoritesCount": favoritesCount,
    "totalVotes": totalVotes,
  };
}

class ListUserData {
  bool? ownedByMe;
  bool? editablebyMe;
  bool? editableByMe;
  bool? favoritedByMe;

  ListUserData({
    this.ownedByMe,
    this.editablebyMe,
    this.editableByMe,
    this.favoritedByMe,
  });

  factory ListUserData.fromJson(Map<String, dynamic> json) => ListUserData(
    ownedByMe: json["ownedByMe"],
    editablebyMe: json["editablebyMe"],
    editableByMe: json["editableByMe"],
    favoritedByMe: json["favoritedByMe"],
  );

  Map<String, dynamic> toJson() => {
    "ownedByMe": ownedByMe,
    "editablebyMe": editablebyMe,
    "editableByMe": editableByMe,
    "favoritedByMe": favoritedByMe,
  };
}

class Meta {
  String? pageType;
  int? currentPage;
  int? perPage;
  int? nextPage;
  dynamic previousPage;

  Meta({
    this.pageType,
    this.currentPage,
    this.perPage,
    this.nextPage,
    this.previousPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pageType: json["page_type"],
    currentPage: json["current_page"],
    perPage: json["per_page"],
    nextPage: json["next_page"],
    previousPage: json["previous_page"],
  );

  Map<String, dynamic> toJson() => {
    "page_type": pageType,
    "current_page": currentPage,
    "per_page": perPage,
    "next_page": nextPage,
    "previous_page": previousPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
