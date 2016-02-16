//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Actor : NSObject
{
	NSDecimalNumber *_cast_id;
	NSString *_character;
	NSString *_credit_id;
	NSDecimalNumber *_id;
	NSString *_name;
	NSDecimalNumber *_order;
	NSString *_profile_path;
}

@property (strong, nonatomic) NSDecimalNumber *cast_id;
@property (strong, nonatomic) NSString *character;
@property (strong, nonatomic) NSString *credit_id;
@property (strong, nonatomic) NSDecimalNumber *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDecimalNumber *order;
@property (strong, nonatomic) NSString *profile_path;

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;

@end
