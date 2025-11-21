//
//  YYNetworking.m
//  YYNetworking
//
//  Created by 云庭 on 2025/8/8.
//

#import "YYNetworking.h"

@implementation YYNetworking

+ (AFHTTPSessionManager *)sessionManager {
    static AFHTTPSessionManager * sessionManager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sessionManager = [AFHTTPSessionManager manager];
        sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        sessionManager.requestSerializer.HTTPShouldHandleCookies = YES;
        sessionManager.requestSerializer.timeoutInterval = 10;
        [sessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.validatesDomainName = NO;
        securityPolicy.allowInvalidCertificates = YES;
        sessionManager.securityPolicy = securityPolicy;
        
    });
    return sessionManager;
}

+ (void)requestWithHTTPMethod:(HTTPMethod)method
                    URLString:(nonnull NSString *)URLString
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    [self requestWithHTTPMethod:method
                      URLString:URLString
                  authorization:nil
                     parameters:parameters
                        success:success
                        failure:failure];
}
+ (void)requestWithHTTPMethod:(HTTPMethod)method
                    URLString:(nonnull NSString *)URLString
                authorization:(nullable NSString *)authorization
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    [self requestWithHTTPMethod:method
                      URLString:URLString
                        headers:@{@"Authorization":authorization}
                     parameters:parameters
                        success:success
                        failure:failure];
}


+ (void)requestWithHTTPMethod:(HTTPMethod)method
                    URLString:(nonnull NSString *)URLString
                      headers:(nullable NSDictionary *)headers
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    AFHTTPSessionManager *manager = [YYNetworking sessionManager];
    
    for (id key in headers.allKeys) {
        id value = headers[key];
        if (![key isKindOfClass:[NSString class]]) continue;
        if (![value isKindOfClass:[NSString class]]) value = [value description];
        if ([(NSString *)value length] > 0) {
            [manager.requestSerializer setValue:value forHTTPHeaderField:key];
        }
    }
    
    switch (method) {
        case HTTPMethodGet: {
            [manager GET:URLString
              parameters:parameters
                 headers:nil
                progress:nil
                 success:success
                 failure:failure];
            break;
        }
            
        case HTTPMethodHead: {
            [manager HEAD:URLString
               parameters:parameters
                  headers:nil
                  success:^(NSURLSessionDataTask *_Nonnull task) { if (success) success(task,nil);}
                  failure:failure];
            break;
        }
            
        case HTTPMethodPost: {
            [manager POST:URLString
               parameters:parameters
                  headers:nil
                 progress:nil
                  success:success
                  failure:failure];
            break;
        }
            
        case HTTPMethodPut: {
            [manager PUT:URLString
              parameters:parameters
                 headers:nil
                 success:success
                 failure:failure];
            break;
        }
            
        case HTTPMethodDelete: {
            [manager DELETE:URLString
                 parameters:parameters
                    headers:nil
                    success:success
                    failure:failure];
            break;
        }
            
        default:
            break;
    }
}


+ (void)postRequestWithURLString:(nonnull NSString *)URLString
                      parameters:(nullable NSDictionary *)parameters
           constructingBodyBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                        progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                         success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    [self postRequestWithURLString:URLString
                     authorization:nil
                        parameters:parameters
             constructingBodyBlock:block
                          progress:uploadProgress
                           success:success
                           failure:failure];
}


+ (void)postRequestWithURLString:(nonnull NSString *)URLString
                   authorization:(nullable NSString *)authorization
                      parameters:(nullable NSDictionary *)parameters
           constructingBodyBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                        progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                         success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    AFHTTPSessionManager *manager = [YYNetworking sessionManager];
    
    if (authorization && authorization.length)[manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
    
    [manager POST:URLString
       parameters:parameters
          headers:nil
constructingBodyWithBlock:block
         progress:uploadProgress
          success:success
          failure:failure];
}

@end
