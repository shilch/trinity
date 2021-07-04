# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changeDisplayName**](DefaultApi.md#changedisplayname) | **put** /user/{username} | Change display name
[**getGrids**](DefaultApi.md#getgrids) | **get** /grids | Grid power information
[**login**](DefaultApi.md#login) | **post** /login | Log the user in
[**replaceSSHKey**](DefaultApi.md#replacesshkey) | **put** /ssh-key | Replace the maintenance SSH key
[**showUserInfo**](DefaultApi.md#showuserinfo) | **get** /user | Show user information


# **changeDisplayName**
> changeDisplayName(username, displayName)

Change display name

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: matrix_session
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKeyPrefix = 'Bearer';

var api_instance = new DefaultApi();
var username = username_example; // String | Username
var displayName = displayName_example; // String | New Display Name

try { 
    api_instance.changeDisplayName(username, displayName);
} catch (e) {
    print('Exception when calling DefaultApi->changeDisplayName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Username | 
 **displayName** | **String**| New Display Name | 

### Return type

void (empty response body)

### Authorization

[matrix_session](../README.md#matrix_session)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGrids**
> BuiltList<Grid> getGrids()

Grid power information

Get current information of the power grid

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: matrix_session
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKeyPrefix = 'Bearer';

var api_instance = new DefaultApi();

try { 
    var result = api_instance.getGrids();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getGrids: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList<Grid>**](Grid.md)

### Authorization

[matrix_session](../README.md#matrix_session)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> login(username, password)

Log the user in

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DefaultApi();
var username = username_example; // String | 
var password = password_example; // String | 

try { 
    api_instance.login(username, password);
} catch (e) {
    print('Exception when calling DefaultApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 
 **password** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceSSHKey**
> replaceSSHKey(key)

Replace the maintenance SSH key

Replace the maintenance SSH key for user \"bastion\". Requires admin permissions.

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: matrix_session
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKeyPrefix = 'Bearer';

var api_instance = new DefaultApi();
var key = key_example; // String | New SSH Key

try { 
    api_instance.replaceSSHKey(key);
} catch (e) {
    print('Exception when calling DefaultApi->replaceSSHKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **String**| New SSH Key | 

### Return type

void (empty response body)

### Authorization

[matrix_session](../README.md#matrix_session)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **showUserInfo**
> showUserInfo()

Show user information

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: matrix_session
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('matrix_session').apiKeyPrefix = 'Bearer';

var api_instance = new DefaultApi();

try { 
    api_instance.showUserInfo();
} catch (e) {
    print('Exception when calling DefaultApi->showUserInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[matrix_session](../README.md#matrix_session)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

