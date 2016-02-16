//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSArray;

@interface Movie : NSObject
{
	NSString *_poster_path;
	BOOL _adult;
	NSString *_overview;
	NSString *_release_date;
	NSArray *_genre_ids;
	NSDecimalNumber *_id;
	NSString *_original_title;
	NSString *_original_language;
	NSString *_title;
	NSString *_backdrop_path;
	NSDecimalNumber *_popularity;
	NSDecimalNumber *_vote_count;
	BOOL _video;
	NSDecimalNumber *_vote_average;
}

@property (strong, nonatomic) NSString *poster_path;
@property (assign, nonatomic) BOOL adult;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSString *release_date;
@property (strong, nonatomic) NSArray *genre_ids;
@property (strong, nonatomic) NSDecimalNumber *id;
@property (strong, nonatomic) NSString *original_title;
@property (strong, nonatomic) NSString *original_language;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *backdrop_path;
@property (strong, nonatomic) NSDecimalNumber *popularity;
@property (strong, nonatomic) NSDecimalNumber *vote_count;
@property (assign, nonatomic) BOOL video;
@property (strong, nonatomic) NSDecimalNumber *vote_average;

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;

@end
