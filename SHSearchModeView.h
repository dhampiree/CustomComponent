//
//  SHSearchModeView.h
//  SocialHub
//
//  Created by Anton on 01.12.16.
//  Copyright © 2016 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SHSearchModeViewDelegate;

typedef enum {
    SEARCH_MODE_PEOPLE = 0,
    SEARCH_MODE_TAGS = 1,
    SEARCH_MODE_PLACES = 2,
    
} SearchModeEnum;

@interface SHSearchModeView : UIView

@property (nonatomic, weak) id <SHSearchModeViewDelegate> delegate;

- (instancetype) initWithWidth:(CGFloat)width;
- (void) setupItemsWithTitles:(NSArray*)titlesArray;
- (void) setTitle:(NSString*)title forItemAtIndex:(NSInteger)index;
- (void) setSelectedItemAtIndex:(NSInteger)index;
- (NSInteger) getSelectedItemIndex;
@end


@protocol SHSearchModeViewDelegate <NSObject>

@required
-(void)valueChanged:(NSInteger)value;

@end
