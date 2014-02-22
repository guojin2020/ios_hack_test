/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.
*/
%hook SpringBoard

-(void) applicationDidFinishLaunching: (id) application
{
	%log((NSString*)@"ello", (NSString *)@"applicationDidFinishLaunching");
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello ello!" 
													message:nil
												   delegate:nil
										  cancelButtonTitle:@"OK"
							       		  otherButtonTitles:nil];
	[alert show];
	[alert release];
	%orig;
}

-(void) powerDownCanceled: (id) fp8
{
	%log((NSString*)@"ello", (NSString *)@"powerDownCanceled");
	//SBScreenShotter *shotter = [%c(SBScreenShotter) sharedInstance];
	//[shotter saveScreenshot:YES];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello ello!" 
													message:nil
												   delegate:nil
										  cancelButtonTitle:@"OK"
							       		  otherButtonTitles:nil];
	[alert show];
	[alert release];
	%orig;
}

-(void) menuButtonDown: (id)event
{
	%log((NSString*)@"ello", (NSString *)@"menuButtonDown");
	//SBScreenShotter *shotter = [%c(SBScreenShotter) sharedInstance];
	//[shotter saveScreenshot:YES];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello ello!" 
													message:nil
												   delegate:nil
										  cancelButtonTitle:@"OK"
							       		  otherButtonTitles:nil];
	[alert show];
	[alert release];
	%orig;
}

%end

