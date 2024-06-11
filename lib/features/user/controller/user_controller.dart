import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/user/model/user.dart';
import 'package:shoesly/features/user/service/user_service.dart';
import 'package:collection/collection.dart';

final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<User>>>((ref) {
  return UserListNotifier(ref);
});

class UserListNotifier extends StateNotifier<AsyncValue<List<User>>> {
  UserListNotifier(
    this.ref,
  ) : super(
          const AsyncValue.loading(),
        );

  final Ref ref;

  Future<void> fetchUsers() async {
    try {
      final List<User> users = await ref.read(userServiceProvider).fetchtodo();

      state = AsyncValue.data(
        users,
      );
    } catch (error) {
      state = AsyncError(
        error,
        StackTrace.current,
      );
    }
  }

  /// get user by id
  User? getUserById(String id) {
    final List<User>? users = state.value;
    return users?.firstWhereOrNull((user) => user.id == id);
  }
}
