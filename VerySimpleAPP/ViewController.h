//
//  ViewController.h
//  VerySimpleAPP
//
//  Created by Белецкий Михаил Александрович on 04.07.18.
//  Copyright © 2018 Белецкий Михаил Александрович. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Interactors.h"
#import "Presenter.h"
@interface ViewController : UIViewController <ViewInteractor>

@property (nonatomic, strong) Presenter* presenter;


@end

