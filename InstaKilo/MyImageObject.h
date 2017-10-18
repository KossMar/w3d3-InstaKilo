//
//  MyImageObject.h
//  InstaKilo
//
//  Created by Mar Koss on 2017-10-18.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MyImageObject : NSObject

- (instancetype)initWithSubject:(NSString*)subject location:(NSString*)location andImage:(UIImage*)image;


@property (nonatomic) NSString *subject;
@property (nonatomic) NSString *location;
@property (nonatomic) UIImage *image;

@end
