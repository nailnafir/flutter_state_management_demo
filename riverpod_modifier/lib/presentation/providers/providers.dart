import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/user.dart';
import '../../repositories/user_repository.dart';

var userRepositoryProvider = Provider.family<UserRepository, CancelToken?>(
  (ref, cancelToken) => UserRepository(cancelToken: cancelToken),
);

var userProvider = FutureProvider.autoDispose.family<User?, int>(
  // (ref, id) => ref.watch(userRepositoryProvider).getUser(id),

  // autoDispose for destory userProvider
  // family for modified value parameters
  // keepAlive for save data state even userProvider destroyed
  (ref, id) async {
    CancelToken cancelToken = CancelToken();

    ref.onDispose(() {
      cancelToken.cancel();
    });

    var user = await ref.watch(userRepositoryProvider(cancelToken)).getUser(id);
    ref.keepAlive();
    return user;
  },
);
