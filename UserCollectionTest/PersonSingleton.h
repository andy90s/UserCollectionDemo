//
//  PersonSingleton.h
//  YONGMIN2.0
//
//  Created by liangbing on 16/7/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

//.h

#define single_interface(class) + (class *)shared##class;


//用于存储用户信息，普通方式和GCD
//.m
#define single_implementation(class) \
static class *_instance;\
\
+(class *)shared##class \
{\
if(_instance == nil){\
_instance = [[self alloc] init];\
}\
return _instance; \
}\
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}