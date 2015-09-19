//
//  ZBottomView.h
//  lifetime
//
//  Created by doubin on 15/6/4.
//  Copyright (c) 2015年 live. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBottomViewDelegate <NSObject>

- (void)bottomViewForMenuButtonClick;
- (void)bottomViewForSettingBtnClick;
- (void)bottomViewForSgControlClick:(UISegmentedControl *)sgControl;

@end

@interface ZBottomView : UIView

@property (nonatomic, weak) id <ZBottomViewDelegate> delegate;

@end
