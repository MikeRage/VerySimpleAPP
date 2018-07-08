//
//  SinModel.h
//  VerySimpleAPP
//
//  Created by Белецкий Михаил Александрович on 08.07.18.
//  Copyright © 2018 Белецкий Михаил Александрович. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;  //конструктор объекта
@end
