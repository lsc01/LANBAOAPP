//
//  WLDeviceStateInfo.m
//  TGParent
//
//  Created by 倪望龙 on 2017/8/23.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import "WLDeviceStateInfo.h"
#import <ifaddrs.h>
#import <net/if.h>
#import <SystemConfiguration/CaptiveNetwork.h>
@implementation WLDeviceStateInfo
+ (BOOL)isWiFiEnabled {
    NSCountedSet * cset = [NSCountedSet new];
    struct ifaddrs *interfaces;
    if( ! getifaddrs(&interfaces) ) {
        for( struct ifaddrs *interface = interfaces; interface; interface = interface->ifa_next) {
            if ( (interface->ifa_flags & IFF_UP) == IFF_UP ) {
                [cset addObject:[NSString stringWithUTF8String:interface->ifa_name]];
            }
        }
    }
    return [cset countForObject:@"awdl0"] > 1 ? YES : NO;
}
@end
