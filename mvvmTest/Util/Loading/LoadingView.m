//
//  LoadingView.m
//  ZPay
//
//  Created by yanxiaogang on 14-6-4.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "LoadingView.h"

#import "LoadingView.h"
#import "SDKUIView+Additions.h"

//#import <QuartzCore/QuartzCore.h>
#define BFBCoreBundleName @"BFBCore.bundle"


@interface LoadingView()
{
    UIImageView *loadingImageView;
    
    
}

@end

@implementation LoadingView

static LoadingView *mLoadingView = nil;



- (id)initWithFrame:(CGRect)frame

{

    self = [super initWithFrame:frame];
 
    if (self) {
      
        // Initialization code
       
    }
   
    return self;
    
}



/*

 // Only override drawRect: if you perform custom drawing.

 // An empty implementation adversely affects performance during animation.

 - (void)drawRect:(CGRect)rect

 {

 // Drawing code

 }

 */

///初始化加载框，这个函数是表示LoadingView的大小，如果是Yes，则loadView的大小为整个窗体，在这种情况下网络请求的时候会遮盖整个窗体，用户其他操作都是无效的相当于同步，如果是No，则loadView的大小为为150*80，用户的其他操作是有效的，这种情况相下需要保证loadingView唯一；

- (id)initIsLikeSynchro:(BOOL)isLikeSynchro{
   
    if (isLikeSynchro) {
        
        self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
       
    }else{
        
        self = [super initWithFrame:CGRectMake((kScreenWidth-150)/2, ([UIApplication sharedApplication].keyWindow.bounds.size.height-80)/2, 150, 80)];
        
    }
 
    if (self) {
       
        self.isLikeSynchro = isLikeSynchro;
       
        self.userInteractionEnabled = YES;
       
        self.backgroundColor = [UIColor clearColor];
     
        
      
        conerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
       
        
        [self setCenter:conerView withParentRect:self.frame];
       
       
        NSString *imgPath=[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/quanjiazai_icon@3x.png",BFBCoreBundleName]];
        UIImageView *loadImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imgPath]];
        
        
        UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.65];
        
        conerView.backgroundColor = color;
        
        [self addSubview:conerView];

        
        if (loadImage.image) {
            
            //conerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
            conerView.backgroundColor = [UIColor clearColor];
            //[self setCenter:conerView withParentRect:self.frame];
            
            loadImage.frame = CGRectMake(0, 0, conerView.width, conerView.height);
            
            [conerView addSubview:loadImage];
            
            NSString *loopImgPath=[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/quanjiazai_quan@3x.png",BFBCoreBundleName]];
            loadingImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:loopImgPath]];
            loadingImageView.frame = CGRectMake((loadImage.width - 54)/2, (loadImage.height - 54)/2, 54, 54);
            
            [loadImage addSubview:loadingImageView];
            
            [self startAnimationOK];
            
            
        }else
        {
            indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(25, 10, 50, 50)];
            
            [conerView addSubview:indicatorView];
            
            [indicatorView startAnimating];
            
            UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 100, 40)];
            
            lblTitle.backgroundColor = [UIColor clearColor];
            
            lblTitle.textColor = [UIColor whiteColor];
            
            lblTitle.textAlignment = NSTextAlignmentCenter;
            
            lblTitle.text = @"加载中...";
            
            lblTitle.font = [UIFont systemFontOfSize:14];
            
            [conerView addSubview:lblTitle];
        }
        
        conerView.layer.cornerRadius = 8;
        
        conerView.layer.masksToBounds = YES;
       
    }
    
    return self;
    
}


#pragma mark --正在转动的圈圈
- (void)startAnimationOK {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2*M_PI);
    animation.duration = 0.8f;
    animation.cumulative = YES;
    animation.removedOnCompletion = NO;
    animation.repeatCount = INT_MAX;
    [loadingImageView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
    
}

- (void)show{
    
    if ([UIApplication sharedApplication].keyWindow.rootViewController.navigationController) {
        
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController.view addSubview:self];
        
    }else{
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
       
    }
    
}

- (void)close{
    
    [self removeFromSuperview];
    
}

+ (LoadingView *)shareLoadingView{
    
    @synchronized(self){
       
        if (mLoadingView==nil) {
            /**
             *  修改此处yes no 判断是全屏加载还是小框加载
             */
            mLoadingView = [[self alloc] initIsLikeSynchro:YES];
           
        }
       
    }
   
    return mLoadingView;
 
}

+ (id)allocWithZone:(NSZone *)zone{
  
    @synchronized(self){
      
        if (mLoadingView==nil) {
          
            mLoadingView = [super allocWithZone:zone];
           
            return mLoadingView;
       
        }

    }

    return  nil;
  
}

///设置子View在父View中居中

- (void)setCenter:(UIView *)child withParentRect:(CGRect)parentRect{
 
    CGRect rect = child.frame;

    rect.origin.x = (parentRect.size.width - child.frame.size.width)/2;
 
    rect.origin.y = (parentRect.size.height - child.frame.size.height)/2;
   
    child.frame = rect;
  
}
@end
