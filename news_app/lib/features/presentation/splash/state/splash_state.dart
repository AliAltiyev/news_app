// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:news_app/product/utils/mixins/string_parser.dart';

class SplashState extends Equatable with StringParser {
  final bool isRequiredUpdateApplication;
  final bool isRedirectUserToHomePage;

  const SplashState({
    this.isRedirectUserToHomePage = false,
    this.isRequiredUpdateApplication = false,
  });

  @override
  List<Object?> get props => [isRequiredUpdateApplication];

  SplashState copyWith({
    bool? isRequiredUpdateApplication,
    bool? isRedirectUserToHomePage,
  }) {
    return SplashState(
      isRequiredUpdateApplication: isRequiredUpdateApplication ?? this.isRequiredUpdateApplication,
      isRedirectUserToHomePage: isRedirectUserToHomePage ?? this.isRedirectUserToHomePage,
    );
  }
}
