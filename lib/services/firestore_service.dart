import 'package:authentication/app/app.logger.dart';
import 'package:authentication/exception/firestore_api_exception.dart';
import 'package:authentication/models/address.dart';
import 'package:authentication/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/app_keys.dart';

class FirestoreService {
  final logger = getLogger('FirestoreApi');

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection(UsersFirestoreKey);

  final CollectionReference regionsCollection = FirebaseFirestore.instance.collection(RegionsFirestoreKey);

  Future<void> createUser({required User user}) async {
    logger.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      logger.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<void> updateUser({required User user}) async {
    logger.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.update(user.toJson());
      logger.v('UserUpdated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to update user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    logger.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        logger.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data();
      logger.v('User found. Data: $userData');

      return User.fromJson((userData! as Map<String, dynamic>));
    } else {
      throw FirestoreApiException(
        message: 'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.',
      );
    }
  }

  Future<bool> saveAddress({
    required Address address,
    required User user,
  }) async {
    logger.i('address:$address');

    try {
      final addressDoc = getAddressCollectionForUser(user.id).doc();
      final newAddressId = addressDoc.id;
      logger.v('Address will be stored with id: $newAddressId');

      await addressDoc.set(
        address.copyWith(id: newAddressId).toJson(),
      );

      final hasDefaultAddress = user.hasAddress;

      logger.v('Address save complete. hasDefaultAddress:$hasDefaultAddress');

      if (!hasDefaultAddress) {
        logger.v('This user has no default address. We need to set the current one as default');

        await usersCollection.doc(user.id).set(
              user.copyWith(defaultAddress: newAddressId).toJson(),
            );

        logger.v('User ${user.id} defaultAddress set to $newAddressId');
      }

      return true;
    } on Exception catch (e) {
      logger.e('We could not save the users address. $e');
      return false;
    }
  }

  Future<bool> isCityServiced({required String city}) async {
    logger.i('city:$city');
    final cityDocument = await regionsCollection.doc(city).get();
    return cityDocument.exists;
  }

  CollectionReference getAddressCollectionForUser(String userId) {
    return usersCollection.doc(userId).collection(AddressesFirestoreKey);
  }
}
