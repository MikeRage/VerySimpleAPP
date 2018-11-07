//
//  Presenter.h
//  VerySimpleAPP
//
//  Created by Белецкий Михаил Александрович on 03.10.18.
//  Copyright © 2018 Белецкий Михаил Александрович. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interactors.h"

@interface Presenter : NSObject <PresenterInteractor>
@property(nonatomic,weak) id<ViewInteractor> view;
@end
