//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

// Import
#import "Actor.h"


@implementation Actor


@synthesize cast_id = _cast_id;
@synthesize character = _character;
@synthesize credit_id = _credit_id;
@synthesize id = _id;
@synthesize name = _name;
@synthesize order = _order;
@synthesize profile_path = _profile_path;


- (void) dealloc
{
	

}

- (id) initWithJSONDictionary:(NSDictionary *)dic
{
	if(self = [super init])
	{
		[self parseJSONDictionary:dic];
	}
	
	return self;
}

- (void) parseJSONDictionary:(NSDictionary *)dic
{
	// PARSER
	id cast_id_ = [dic objectForKey:@"cast_id"];
	if([cast_id_ isKindOfClass:[NSNumber class]])
	{
		self.cast_id = cast_id_;
	}

	id character_ = [dic objectForKey:@"character"];
	if([character_ isKindOfClass:[NSString class]])
	{
		self.character = character_;
	}

	id credit_id_ = [dic objectForKey:@"credit_id"];
	if([credit_id_ isKindOfClass:[NSString class]])
	{
		self.credit_id = credit_id_;
	}

	id id_ = [dic objectForKey:@"id"];
	if([id_ isKindOfClass:[NSNumber class]])
	{
		self.id = id_;
	}

	id name_ = [dic objectForKey:@"name"];
	if([name_ isKindOfClass:[NSString class]])
	{
		self.name = name_;
	}

	id order_ = [dic objectForKey:@"order"];
	if([order_ isKindOfClass:[NSNumber class]])
	{
		self.order = order_;
	}

	id profile_path_ = [dic objectForKey:@"profile_path"];
	if([profile_path_ isKindOfClass:[NSString class]])
	{
		self.profile_path = profile_path_;
	}

	
}

@end
