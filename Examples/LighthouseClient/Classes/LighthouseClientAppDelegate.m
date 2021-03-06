//
//  LighthouseClientAppDelegate.m
//  LighthouseClient
//
//  Created by Mike Laurence on 3/6/10.
//  Copyright Punkbot LLC 2010. All rights reserved.
//

#import "LighthouseClientAppDelegate.h"
#import "Ticket.h"


@implementation LighthouseClientAppDelegate

@synthesize coreManager;
@synthesize window;
@synthesize mainViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {    
    
    // Initialize Core Manager
    self.coreManager = [[[CoreManager alloc] init] autorelease];
    coreManager.logLevel = 1;
    coreManager.remoteSiteURL = @"http://coreresource.lighthouseapp.com";
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:mainViewController.view];
    [window makeKeyAndVisible];
	
	// Send off request to get tickets
	[Ticket findAllRemote];

	return YES;
}

- (void) applicationWillTerminate:(UIApplication *)application {
    [coreManager save];
}



#pragma mark -
#pragma mark Lifecycle End

- (void)dealloc {
    [coreManager release];
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end

