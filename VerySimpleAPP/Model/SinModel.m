//
//  SinModel.m
//  VerySimpleAPP
//
//  Created by Белецкий Михаил Александрович on 08.07.18.
//  Copyright © 2018 Белецкий Михаил Александрович. All rights reserved.
//

#import "SinModel.h"



@implementation SinModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    self.title  = dict[@"title"];
    self.text   = dict[@"text"];
    return self;
}

@end
