//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

// Import

#import "Movie.h"
//#import "NSDecimalNumber.h"


@implementation Movie


@synthesize poster_path = _poster_path;
@synthesize adult = _adult;
@synthesize overview = _overview;
@synthesize release_date = _release_date;
@synthesize genre_ids = _genre_ids;
@synthesize id = _id;
@synthesize original_title = _original_title;
@synthesize original_language = _original_language;
@synthesize title = _title;
@synthesize backdrop_path = _backdrop_path;
@synthesize popularity = _popularity;
@synthesize vote_count = _vote_count;
@synthesize video = _video;
@synthesize vote_average = _vote_average;


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
	id poster_path_ = [dic objectForKey:@"poster_path"];
	if([poster_path_ isKindOfClass:[NSString class]])
	{
		self.poster_path = poster_path_;
	}

	id adult_ = [dic objectForKey:@"adult"];
	if([adult_ isKindOfClass:[NSNumber class]])
	{
		self.adult = [adult_ boolValue];
	}

	id overview_ = [dic objectForKey:@"overview"];
	if([overview_ isKindOfClass:[NSString class]])
	{
		self.overview = overview_;
	}

	id release_date_ = [dic objectForKey:@"release_date"];
	if([release_date_ isKindOfClass:[NSString class]])
	{
		self.release_date = release_date_;
	}

	id genre_ids_ = [dic objectForKey:@"genre_ids"];
	if([genre_ids_ isKindOfClass:[NSArray class]])
	{
	//	self.genre_ids = genre_ids;
	}

	id id_ = [dic objectForKey:@"id"];
	if([id_ isKindOfClass:[NSNumber class]])
	{
		self.id = id_;
	}

	id original_title_ = [dic objectForKey:@"original_title"];
	if([original_title_ isKindOfClass:[NSString class]])
	{
		self.original_title = original_title_;
	}

	id original_language_ = [dic objectForKey:@"original_language"];
	if([original_language_ isKindOfClass:[NSString class]])
	{
		self.original_language = original_language_;
	}

	id title_ = [dic objectForKey:@"title"];
	if([title_ isKindOfClass:[NSString class]])
	{
		self.title = title_;
	}

	id backdrop_path_ = [dic objectForKey:@"backdrop_path"];
	if([backdrop_path_ isKindOfClass:[NSString class]])
	{
		self.backdrop_path = backdrop_path_;
	}

	id popularity_ = [dic objectForKey:@"popularity"];
	if([popularity_ isKindOfClass:[NSNumber class]])
	{
		self.popularity = popularity_;
	}

	id vote_count_ = [dic objectForKey:@"vote_count"];
	if([vote_count_ isKindOfClass:[NSNumber class]])
	{
		self.vote_count = vote_count_;
	}

	id video_ = [dic objectForKey:@"video"];
	if([video_ isKindOfClass:[NSNumber class]])
	{
		self.video = [video_ boolValue];
	}

	id vote_average_ = [dic objectForKey:@"vote_average"];
	if([vote_average_ isKindOfClass:[NSNumber class]])
	{
		self.vote_average = vote_average_;
	}

	
}

@end
