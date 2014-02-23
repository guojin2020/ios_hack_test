/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.
*/
#import "RevealUtil.h"

%hook MicroMessengerAppDelegate

- (BOOL)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2
{
	%log((NSString *)@"ello", (NSString *)@"application start");

	BOOL re = %orig;

	RevealUtil *ru = [[RevealUtil alloc] init];
	[ru startReveal];

	return re;
}

%end
