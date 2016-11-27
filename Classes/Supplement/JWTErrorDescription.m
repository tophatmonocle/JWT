//
//  JWTErrorDescription.m
//  JWT
//
//  Created by Lobanov Dmitry on 27.11.16.
//  Copyright © 2016 JWTIO. All rights reserved.
//

#import "JWTErrorDescription.h"
NSString *JWTErrorDomain = @"com.karma.jwt";
@implementation JWTErrorDescription
+ (NSDictionary *)errorDescriptionsAndCodes {
    static NSDictionary *dictionary = nil;
    return dictionary ?: (dictionary = @{
                                         @(JWTInvalidFormatError): @"Invalid format! Try to check your encoding algorithm. Maybe you put too many dots as delimiters?",
                                         @(JWTUnsupportedAlgorithmError): @"Unsupported algorithm! You could implement it by yourself",
                                         @(JWTAlgorithmNameMismatchError) : @"Algorithm doesn't match name in header.",
                                         @(JWTInvalidSignatureError): @"Invalid signature! It seems that signed part of jwt mismatch generated part by algorithm provided in header.",
                                         @(JWTNoPayloadError): @"No payload! Hey, forget payload?",
                                         @(JWTNoHeaderError): @"No header! Hmm",
                                         @(JWTEncodingHeaderError): @"It seems that header encoding failed",
                                         @(JWTEncodingPayloadError): @"It seems that payload encoding failed",
                                         @(JWTEncodingSigningError): @"It seems that signing output corrupted. Make sure signing worked (e.g. we may have issues extracting the key from the PKCS12 bundle if passphrase is incorrect).",
                                         @(JWTClaimsSetVerificationFailed): @"It seems that claims verification failed",
                                         @(JWTInvalidSegmentSerializationError): @"It seems that json serialization failed for segment",
                                         @(JWTUnspecifiedAlgorithmError): @"Unspecified algorithm! You must explicitly choose an algorithm to decode with.",
                                         @(JWTBlacklistedAlgorithmError): @"Algorithm in blacklist? Try to check whitelist parameter",
                                         @(JWTDecodingHeaderError): @"Error decoding the JWT Header segment.",
                                         @(JWTDecodingPayloadError): @"Error decoding the JWT Payload segment."
                                         }, dictionary);
}

+ (NSString *)userDescriptionForErrorCode:(JWTError)code {
    NSString *resultString = [self errorDescriptionsAndCodes][@(code)];
    return resultString ?: @"Unexpected error";
}

+ (NSError *)errorWithCode:(JWTError)code {
    return [self errorWithCode:code withUserDescription:[self userDescriptionForErrorCode:code]];
}

+ (NSError *)errorWithCode:(NSInteger)code withUserDescription:(NSString *)string {
    return [NSError errorWithDomain:JWTErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: string}];
}
@end
