import 'package:animal_ar/mail/end_points.dart';
import 'package:animal_ar/service/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:mailtm_client/mailtm_client.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'mail_service.g.dart';

class ApiMailData {
  ApiMailData._();
  static final ApiMailData _apiMailData = ApiMailData._();
  static ApiMailData get instance => _apiMailData;

  RestClientApi get restClient => RestClientApi(dioClient(Endpoints.baseUrl));
}

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @GET('/domains')
  Future<HydraDomains> getDomains(
    @Query('page') int page,
  );

  /// Gets domain from its id
  @GET('/domains/{id}')
  Future<Domain> getDomain(
    @Path() String id,
  );

  /// Get a JWT authentication token
  @POST('/token')
  Future<Token> getToken(
    @Field() String address,
    @Field() String password,
  );

  /// Creates an account
  @POST('/accounts')
  Future<Account> createAccount(
    @Field() String address,
    @Field() String password,
  );

  /// Gets an account from its id
  @GET('/accounts/{id}')
  Future<Account> getAccount(
    @Path() String id,
    @Header('Authorization') String token,
  );

  /// Gets an account while being authenticated
  @GET('/me')
  Future<Account> me(
    @Header('Authorization') String token,
  );

  /// Gets a messages list from its page
  @GET('/messages')
  Future<HydraMessages> getMessages(
    @Query('page') int page,
    @Header('Authorization') String token,
  );

  /// Gets a message from its id
  @GET('/messages/{id}')
  Future<Message> getMessage(
    @Path() String id,
    @Header('Authorization') String token,
  );

  /// Downloads the attachment
  @GET('/{downloadUrl}')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> downloadAttachment(
    @Path() String downloadUrl,
    @Header('Authorization') String token,
  );

  /// Gets a message's source
  @GET('/sources/{id}')
  Future<MessageSource> getMessageSource(
    @Path() String id,
    @Header('Authorization') String token,
  );
}
