//
//  MyImageObject.m
//  InstaKilo
//
//  Created by Mar Koss on 2017-10-18.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "MyImageObject.h"

@implementation MyImageObject


- (instancetype)initWithSubject:(NSString*)subject location:(NSString*)location andImage:(UIImage*)image {
    self = [super init];
    if (self) {
        _subject = subject;
        _location = location;
        _image = image;
    }
    return self;
}

@end
