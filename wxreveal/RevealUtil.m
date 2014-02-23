#import "RevealUtil.h"
#import <dlfcn.h>

@implementation RevealUtil

- (void)startReveal
{
    NSString *revealLibName = @"libReveal.dylib";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *dyLibPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, revealLibName];
    NSLog(@"Loading dynamic library: %@", dyLibPath);

    _revealLib = NULL;
    _revealLib = dlopen([dyLibPath cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);

    if (_revealLib == NULL) 
    {
        char *error = dlerror();
        NSLog(@"dlopen error: %s", error);
        NSString *message = [NSString stringWithFormat:@"%@ failed to load with error: %s", revealLibName, error];
        [[[UIAlertView alloc] initWithTitle:@"Reveal library could not be loaded" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
	else 
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:self];
	}
}

- (void)stopReveal 
{
    if (_revealLib) 
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStop" object:self];
        if (dlclose(_revealLib) == 0) 
        {
            NSLog(@"Reveal library unloaded");
            _revealLib = NULL;
        }
        else 
        {
            char *error = dlerror();
            NSLog(@"Reveal library could not be unloaded: %s", error);
        }
    }
}

@end
