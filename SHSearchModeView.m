//
//  SHSearchModeView.m
//  SocialHub
//
//  Created by Anton on 01.12.16.
//  Copyright © 2016 SH. All rights reserved.
//

#import "SHSearchModeView.h"

#define STANDART_HEIGHT 40
#define GREY_COLOR [UIColor colorWithRed:114/255.0 green:121/255.0 blue:131/255.0 alpha:1.0]
#define BLUE_COLOR [UIColor colorWithRed:117/255.0 green:183/255.0 blue:255/255.0 alpha:1.0]
#define SEPARATOR_BORDER_WIDTH 1

@interface SHSearchModeView()

@property (nonatomic, strong) NSMutableArray* items;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) NSInteger selectedIndex;

@end


@implementation SHSearchModeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (instancetype) initWithWidth:(CGFloat)width {
    self = [super init];
    
    if(self) {
        _width = width;
        self.frame = CGRectMake(0, 0, width, STANDART_HEIGHT);
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}


- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        _width = CGRectGetWidth(frame);
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return self;
}


- (void) setupItemsWithTitles:(NSArray*)titlesArray {
    NSInteger countOfItmes = [titlesArray count];

    NSArray* views = self.subviews;
    for(UIView* v in views)
        [v removeFromSuperview];

    [self addSeparatorViewsForItemsCount:countOfItmes];
    
    self.items = [NSMutableArray new];
    CGFloat itemWidth = _width / countOfItmes;
    for(int i=0; i < countOfItmes; i++) {
        
        UIButton* item = [UIButton buttonWithType:UIButtonTypeSystem];
        item.frame = CGRectMake(0, 0, itemWidth-3, STANDART_HEIGHT);
        item.tag = i;
        item.center = CGPointMake(((i+1)*2-1)*itemWidth*0.5, self.center.y);
        [item setTitle:[titlesArray objectAtIndex:i] forState:UIControlStateNormal];
        
        [item setTitleColor:[UIColor whiteColor] forState:(UIControlStateHighlighted | UIControlStateNormal | UIControlStateSelected)];
        [item setTitleColor:BLUE_COLOR forState:UIControlStateDisabled];
        [item setTintColor:[UIColor whiteColor]];
        
        
        [item addTarget:self action:@selector(actionValueChanged:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:item];
        [self.items addObject:item];
    }
    
    [self setSelectedItemAtIndex:0];
}


- (void) addSeparatorViewsForItemsCount:(NSInteger)itemsCount {
    UIView* horizontalSeparator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), SEPARATOR_BORDER_WIDTH)];
    horizontalSeparator.backgroundColor = GREY_COLOR;
    horizontalSeparator.alpha = 0.5;
    [self addSubview:horizontalSeparator];
    
    CGFloat itemWidth = CGRectGetWidth(self.frame)/itemsCount;
    for(int i=0; i < itemsCount-1; i++) {
        UIView* verticalSeparator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SEPARATOR_BORDER_WIDTH, CGRectGetHeight(self.frame)*0.6)];
        verticalSeparator.backgroundColor = GREY_COLOR;
        verticalSeparator.alpha = 0.5;
        verticalSeparator.center = CGPointMake((i+1)*itemWidth, self.center.y);
        [self addSubview:verticalSeparator];
    }
}


- (void) setTitle:(NSString*)title forItemAtIndex:(NSInteger)index {
    if(index < 0 || index > self.items.count - 1) {
        NSLog(@" >>> Index out of range!");
        return;
    }
    
    UIButton* item = [self.items objectAtIndex:index];
    item.titleLabel.text = title;
}


- (void) setSelectedItemAtIndex:(NSInteger)index {
    _selectedIndex = index;
    if (index >=0 && index < self.items.count) {
        for(UIButton* item in self.items)
            item.enabled = item.tag == index ? NO : YES;
    }
    [self.delegate valueChanged:index];
}


- (void) actionValueChanged:(UIButton*)sender {
    for(UIButton* item in self.items)
        item.enabled = [item isEqual:sender] ? NO : YES;
    
    [self.delegate valueChanged:sender.tag];
}


- (NSInteger) getSelectedItemIndex {
    return _selectedIndex;
}



@end
