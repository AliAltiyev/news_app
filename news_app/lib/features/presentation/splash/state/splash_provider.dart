import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../product/model/number.dart';
import '../../../../product/utils/enums/firebase_collections.dart';
import '../../../../product/utils/enums/platform.dart';
import '../../../../product/utils/mixins/string_parser.dart';
import 'splash_state.dart';

class SplashProvider extends StateNotifier<SplashState> with StringParser {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String deviceVersion) async {
    final databaseValue = await getVersionNumberFromFirebase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRequiredUpdateApplication: true);

      return;
    }

    final checkForceUpdate = stringParser(deviceVersion, databaseValue);

    if (checkForceUpdate != null) {
      if (checkForceUpdate) {
        state = state.copyWith(isRequiredUpdateApplication: true);
        return;
      }
    }
    state = state.copyWith(isRedirectUserToHomePage: true);
  }

//! getVersionNumberFromFirebase
  Future<String?> getVersionNumberFromFirebase() async {
    final response = await FirebaseCollections.versionControl.ref
        .withConverter<Number>(
          fromFirestore: (snapshot, options) {
            final data = snapshot.data();

            if (data != null) {
              return Number.fromMap(snapshot.data()!);
            } else {
              throw FirebaseException(plugin: 'sdsd');
            }
          },
          toFirestore: (value, options) => {},
        )
        .doc(PlatformEnum.versionName)
        .get();
    return response.data()?.number;
  }
}
