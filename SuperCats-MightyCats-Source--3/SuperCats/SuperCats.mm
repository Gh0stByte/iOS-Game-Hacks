#import <Preferences/Preferences.h>

@interface SuperCatsListController: PSListController {
}
@end

#define PLIST_PATH @"/var/mobile/Library/Preferences/SuperCats.plist"

inline void SetPrefInt(NSString *key, int value) 
{ 
	NSNumber *obj = [NSNumber numberWithInt:value]; 
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH]; 
	[dict setObject:obj forKey:key]; 
	[dict writeToFile:PLIST_PATH atomically:YES]; 
} 

inline int GetPrefInt(NSString *key) 
{ 
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue]; 
}

inline bool GetPrefBool(NSString *key) 
{
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

UIWebView *webview;
NSTimer *t;

bool ty = false;
@implementation SuperCatsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SuperCats" target:self] retain];
	}
	
	return _specifiers;
}


- (id)init
{
	if(ty)
	{
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Thank you!" message:@"Thank you for donating! It means a lot to me!\n~Gh0stByte" delegate:nil cancelButtonTitle:@"You're Welcome!" otherButtonTitles:nil]; [a show]; [a release];
		ty = false;
	}
	self = [super init];
	if(self)
	{
		if(!((UINavigationItem*)self.navigationItem).rightBarButtonItem)
		{
			UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Donate" style:UIBarButtonItemStyleBordered target:self action:@selector(donate)];
			((UINavigationItem*)self.navigationItem).rightBarButtonItem = button;
			[button release];
		}
	}
	
	bool enableA = false;
	if(enableA)
	{
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;

	UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, screenHeight -100, screenWidth,screenHeight)];
       	[self.view addSubview:webview];
       	webview.scrollView.scrollEnabled = NO; 
		webview.scrollView.bounces = NO;
	//webview.scalesPageToFit = YES;
       NSString *url=@"http://idroidcheats.net/iOS/index.html";
	NSURL *nsurl=[NSURL URLWithString:url];
	NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
	[webview loadRequest:nsrequest];
	}

	return self;
}

-(void)kill
{
	[webview removeFromSuperview];
	[t invalidate];
}

-(void)donate{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://bit.ly/Gh0stBytePayPal"]];
	ty = true;
}
-(void)iOSCheaters
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://iOSCheaters.com"]];
}
-(void)respring
{
	system("killall SpringBoard");
}
@end

@interface SuperCatsCreditsSettingsListController : PSListController {}
@end
@implementation SuperCatsCreditsSettingsListController
-(void)donate
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://bit.ly/Gh0stBytePayPal"]];
}
-(void)iOSCheaters
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://iOSCheaters.com"]];
}
@end


// vim:ft=objc
