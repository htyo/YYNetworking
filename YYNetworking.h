//
//  YYNetworking.h
//  YYNetworking
//
//  Created by 云庭 on 2025/8/8.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, HTTPMethod) {
    HTTPMethodGet       = 1,
    HTTPMethodHead      = 2,
    HTTPMethodPost      = 3,
    HTTPMethodPut       = 4,
    HTTPMethodDelete    = 5
};


NS_ASSUME_NONNULL_BEGIN

@interface YYNetworking : NSObject
+ (AFHTTPSessionManager *)sessionManager;

+ (void)requestWithHTTPMethod:(HTTPMethod)method
                    URLString:(nonnull NSString *)URLString
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

+ (void)requestWithHTTPMethod:(HTTPMethod)method
                    URLString:(nonnull NSString *)URLString
                authorization:(nullable NSString *)authorization
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

+ (void)requestWithHTTPMethod:(HTTPMethod)method
                    URLString:(nonnull NSString *)URLString
                      headers:(nullable NSDictionary *)headers
                   parameters:(nullable NSDictionary *)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

+ (void)postRequestWithURLString:(nonnull NSString *)URLString
                      parameters:(nullable NSDictionary *)parameters
       constructingBodyBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                        progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                         success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;


+ (void)postRequestWithURLString:(nonnull NSString *)URLString
                   authorization:(nullable NSString *)authorization
                      parameters:(nullable NSDictionary *)parameters
       constructingBodyBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                        progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                         success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

@end

NS_ASSUME_NONNULL_END
