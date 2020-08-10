//
//  JWTClaimBaseBuilder.h
//  JWT
//
//  Created by Dmitry Lobanov on 10.08.2020.
//  Copyright © 2020 JWTIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWTClaimsSetsProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface JWTClaimBaseBuilder : NSObject <JWTClaimBuilderProtocol>
@property (nonatomic, readwrite) id<JWTClaimsAccessorProtocol> accessor;
@end

NS_ASSUME_NONNULL_END
