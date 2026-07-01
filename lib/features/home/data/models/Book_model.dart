class BookModel {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      kind: json['kind']?.toString(),
      id: json['id']?.toString(),
      etag: json['etag']?.toString(),
      selfLink: json['selfLink']?.toString(),
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),

      saleInfo: json['saleInfo'] != null
          ? SaleInfo.fromJson(json['saleInfo'])
          : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'])
          : null,
      searchInfo: json['searchInfo'] != null
          ? SearchInfo.fromJson(json['searchInfo'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      if (volumeInfo != null) 'volumeInfo': volumeInfo!.toJson(),
      if (saleInfo != null) 'saleInfo': saleInfo!.toJson(),
      if (accessInfo != null) 'accessInfo': accessInfo!.toJson(),
      if (searchInfo != null) 'searchInfo': searchInfo!.toJson(),
    };
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String> authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers> industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String> categories;
  double? averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors = const [],
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers = const [],
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories = const [],
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    required this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title']?.toString(),
      subtitle: json['subtitle']?.toString(),
      // ✅ never crashes even if null or elements are not strings
      authors: json['authors'] != null
          ? List<String>.from(json['authors'].map((e) => e.toString()))
          : [],
      publisher: json['publisher']?.toString(),
      publishedDate: json['publishedDate']?.toString(),
      description: json['description']?.toString(),
      industryIdentifiers: json['industryIdentifiers'] != null
          ? List<IndustryIdentifiers>.from(
              json['industryIdentifiers'].map(
                (v) => IndustryIdentifiers.fromJson(v),
              ),
            )
          : [],
      readingModes: json['readingModes'] != null
          ? ReadingModes.fromJson(json['readingModes'])
          : null,
      pageCount: json['pageCount'] != null
          ? int.tryParse(json['pageCount'].toString())
          : null,
      printType: json['printType']?.toString(),
      // ✅ never crashes even if null or elements are not strings
      categories: json['categories'] != null
          ? List<String>.from(json['categories'].map((e) => e.toString()))
          : [],
      // ✅ handles both int and double from API
      averageRating: json['averageRating'] != null
          ? double.tryParse(json['averageRating'].toString())
          : null,
      ratingsCount: json['ratingsCount'] != null
          ? int.tryParse(json['ratingsCount'].toString())
          : null,
      maturityRating: json['maturityRating']?.toString(),
      allowAnonLogging: json['allowAnonLogging'],
      contentVersion: json['contentVersion']?.toString(),
      panelizationSummary: json['panelizationSummary'] != null
          ? PanelizationSummary.fromJson(json['panelizationSummary'])
          : null,
      imageLinks: ImageLinks.fromJson(json['imageLinks']),

      language: json['language']?.toString(),
      previewLink: json['previewLink']?.toString(),
      infoLink: json['infoLink']?.toString(),
      canonicalVolumeLink: json['canonicalVolumeLink']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'industryIdentifiers': industryIdentifiers
          .map((v) => v.toJson())
          .toList(),
      if (readingModes != null) 'readingModes': readingModes!.toJson(),
      'pageCount': pageCount,
      'printType': printType,
      'categories': categories,
      'averageRating': averageRating,
      'ratingsCount': ratingsCount,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      if (panelizationSummary != null)
        'panelizationSummary': panelizationSummary!.toJson(),
      if (imageLinks != null) 'imageLinks': imageLinks!.toJson(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
    };
  }
}

class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifiers(
      type: json['type']?.toString(),
      identifier: json['identifier']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) {
    return ReadingModes(text: json['text'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {'text': text, 'image': image};
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'],
      containsImageBubbles: json['containsImageBubbles'],
    );
  }

  Map<String, dynamic> toJson() => {
    'containsEpubBubbles': containsEpubBubbles,
    'containsImageBubbles': containsImageBubbles,
  };
}

class ImageLinks {
  String? smallThumbnail;
  String thumbnail;

  ImageLinks({this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    final smallThumb = json['smallThumbnail']?.toString();
    final thumb = json['thumbnail']?.toString() ?? smallThumb ?? '';
    return ImageLinks(smallThumbnail: smallThumb, thumbnail: thumb);
  }

  Map<String, dynamic> toJson() => {
    'smallThumbnail': smallThumbnail,
    'thumbnail': thumbnail,
  };
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;

  SaleInfo({this.country, this.saleability, this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      country: json['country']?.toString(),
      saleability: json['saleability']?.toString(),
      isEbook: json['isEbook'],
    );
  }

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
  };
}

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country']?.toString(),
      viewability: json['viewability']?.toString(),
      embeddable: json['embeddable'],
      publicDomain: json['publicDomain'],
      textToSpeechPermission: json['textToSpeechPermission']?.toString(),
      epub: json['epub'] != null ? Epub.fromJson(json['epub']) : null,
      pdf: json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null,
      webReaderLink: json['webReaderLink']?.toString(),
      accessViewStatus: json['accessViewStatus']?.toString(),
      quoteSharingAllowed: json['quoteSharingAllowed'],
    );
  }

  Map<String, dynamic> toJson() => {
    'country': country,
    'viewability': viewability,
    'embeddable': embeddable,
    'publicDomain': publicDomain,
    'textToSpeechPermission': textToSpeechPermission,
    if (epub != null) 'epub': epub!.toJson(),
    if (pdf != null) 'pdf': pdf!.toJson(),
    'webReaderLink': webReaderLink,
    'accessViewStatus': accessViewStatus,
    'quoteSharingAllowed': quoteSharingAllowed,
  };
}

class Epub {
  bool? isAvailable;

  Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) {
    return Epub(isAvailable: json['isAvailable']);
  }

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};
}

class Pdf {
  bool? isAvailable;
  String? acsTokenLink;

  Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      isAvailable: json['isAvailable'],
      acsTokenLink: json['acsTokenLink']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'isAvailable': isAvailable,
    'acsTokenLink': acsTokenLink,
  };
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) {
    return SearchInfo(textSnippet: json['textSnippet']?.toString());
  }

  Map<String, dynamic> toJson() => {'textSnippet': textSnippet};
}
