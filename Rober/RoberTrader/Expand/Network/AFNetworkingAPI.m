//
//  AFNetworkingAPI.m
//  Xcode
//
//  Created by Hanxun on 16/12/15.
//  Copyright © 2016年 Hanxun. All rights reserved.
//

#import "AFNetworkingAPI.h"

@implementation AFNetworkingAPI



+ (instancetype)shared
{
    static AFNetworkingAPI *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken ,^{
        
        _sharedClient = [[AFNetworkingAPI alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}



#pragma mark 获得后台数据

- (void)getOilMessage:(NSDictionary *)userParameter
                  url:(NSString *)userURL
              success:(SuccessBlock)successBlock
                 fail:(FailureBlock)failureBlock
{
    [[AFNetworkingAPI shared] GET:@"http://apis.juhe.cn/oil/region?key=c14e3aca3b57e94a895f281b8ad50200&format=2&city=%E5%8C%97%E4%BA%AC%E5%B8%82"
                       parameters:nil
                         progress:nil
                          success:^(NSURLSessionTask *__unused task, id JSON){
                              
                              successBlock(JSON);
                          }
                          failure:^(NSURLSessionTask *__unused task, NSError *error){
                              
                              NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
                              failureBlock(errorStr);
                          }];
}






@end






