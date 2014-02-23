#import <Foundation/Foundation.h>

@interface RevealUtil : NSObject {
	void *_revealLib;
}

- (void) startReveal;
- (void) stopReveal;

@end
