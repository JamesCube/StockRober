//
//  AFNetworkingAPI.h
//  Xcode
//
//  Created by Hanxun on 16/12/15.
//  Copyright © 2016年 Hanxun. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

 

// Base URL
#define BaseURLString @"http://apis.juhe.cn/oil/region?/"



// Block
typedef void(^SuccessBlock)(id responseBody);
typedef void(^FailureBlock)(NSString *error);




@interface AFNetworkingAPI : AFHTTPSessionManager

+ (instancetype)shared;



// ext method
- (void)getOilMessage:(NSDictionary *)userParameter
                  url:(NSString *)userURL
              success:(SuccessBlock)successBlock
                 fail:(FailureBlock)failureBlock;



@end
