#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#include <substrate.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/SuperCats.plist"

inline int GetPrefInt(NSString *key)
{
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

inline bool GetPrefBool(NSString *key) 
{
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline void SetPrefBool(NSString *key, bool value) 
{
	NSNumber *obj = [NSNumber numberWithBool:value];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH];
	[dict setObject:obj forKey:key];
	[dict writeToFile:PLIST_PATH atomically:YES];
}

inline void SetPrefInt(NSString *key, int value) 
{
	NSNumber *obj = [NSNumber numberWithInt:value];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH];
	[dict setObject:obj forKey:key];
	[dict writeToFile:PLIST_PATH atomically:YES];
}

inline bool GPB(NSString *key) 
{
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



%hook MCGameData

-(void)addToScore:(int)arg1
{
if(GetPrefBool(@"kScore")){%orig(9999999);}%orig;
}

%end

%hook MCHeroCat

-(void)hitWithPower:(int)arg1
{if(GPB(@"kInv")){%orig(0);}else{%orig;}
}

%end

%hook MCEnemy

-(void)hitWithPower:(int)arg1
{if(GPB(@"kInv")){%orig(100);}else{%orig;}
}

%end


%hook FlurryHTTPResponse
-(id) initWithBody:(id)arg1 statusCode:(int)arg2 headers:(id)arg3 error:(id)arg4
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook TFTWebViewController
-(id) initWithAdType:(id)arg1 ad:(id)arg2 delegate:(id)arg3
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook TFTFullScreenAd
-(id) initWithType:(id)arg1 path:(id)arg2 delegate:(id)arg3
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook TFTAdRequest
-(id) initWithPath:(id)arg1 withHandler:(id)arg2
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook TFTAd
-(id) initWithDictionary:(id)arg1
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook CBLoadingView
-(id) initWithFrame:(CGRect)arg1
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook TFTAdRequest
+(void) startNewAdRequestWithPath:(id)arg1 withHandler:(id)arg2
{
	if(GetPrefBool(@"kAds"))
	{
		
	}else{
	%orig;}
}
%end

%hook FlurryPLCrashReport
-(id)threads
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook FlurryNetworkUtil
+(void) setAdServerUrl:(id)arg1
{
	if(GetPrefBool(@"kAds"))
	{
	
	}else{
	%orig;}
}
%end

%hook FlurryNetworkUtil
+(id)adServerUrl
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end

%hook TFTAd
-(void) setAds:(id)arg1
{
	if(GetPrefBool(@"kAds"))
	{
	
	}else{
	%orig;}
}
%end

%hook TFTAd
-(id)ads
{
	if(GetPrefBool(@"kAds"))
	{
		return nil;
	}
	return %orig;
}
%end