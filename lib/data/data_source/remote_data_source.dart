import 'package:flutter_cleanarchi_with_mvvm_finished/data/network/app_api.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/data/network/requests.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  Future<ForgotPasswordResponse> forgotPassword(String email);

  Future<HomeResponse> getHomeData();
  Future<HomeStoreDetailsResponse> getHomeStoreDetailsData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password,
        "");
  }

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appServiceClient.getHomeData();
  }

  @override
  Future<HomeStoreDetailsResponse> getHomeStoreDetailsData()async {
    return await _appServiceClient.getHomeStoreDetailsData();

  }
}
