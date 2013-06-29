//
//  JSLocalizedString.m
//  JsLocalizedString
//
//  Created by JS Lim on 6/29/13.
//  Copyright (c) 2013 Js Lim. All rights reserved.
//

#import "JSLocalizedString.h"

#define kJSLocalizedStringUserDefaultsKey @"JSLocalizedLanguage"

@implementation JSLocalizedString

static JSLocalizedString *_sharedLocalizedString = nil;
static NSBundle *_bundle = nil;

+ (JSLocalizedString *)sharedLocalizableSystem
{
    @synchronized([JSLocalizedString class])
	{
		if (!_sharedLocalizedString){
			[[self alloc] init];
		}
		return _sharedLocalizedString;
	}
    return nil;
}

+ (id)alloc
{
	@synchronized([JSLocalizedString class])
	{
		NSAssert(_sharedLocalizedString == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedLocalizedString = [super alloc];
		return _sharedLocalizedString;
	}
	// to avoid compiler warning
	return nil;
}

- (id)init
{
    if ((self = [super init])) {
        _bundle = [NSBundle mainBundle];
        
        NSString *selectedLanguage = JSGetLanguage();
        if (!selectedLanguage) {
            JSSetLanguage(@"en");
        } else {
            JSSetLanguage(selectedLanguage);
        }
    }
    return self;
}

// Gets the current localized string as in NSLocalizedString.
//
// example calls:
// JSLocalizedString(@"Text to localize",@"Alternative text, in case hte other is not find");
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
	return [_bundle localizedStringForKey:key value:comment table:nil];
}

// Sets the desired language of the ones you have.
// example calls:
// JSSetLanguage(@"en");
// JSSetLanguage(@"zh-Hans");
//
- (void)setLanguage:(NSString *)language{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:language forKey:kJSLocalizedStringUserDefaultsKey];
    [defaults synchronize];
	
	NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj"];
    
	if (path == nil)
		//in case the language does not exists
		[self resetLocalization];
	else
		_bundle = [NSBundle bundleWithPath:path];
}

// Just gets the current setted up language.
// returns "en";
//
// example call:
// NSString * currentLanguage = JSGetLanguage();
- (NSString*)getLanguage{
    
	NSString* language = [[NSUserDefaults standardUserDefaults] objectForKey:kJSLocalizedStringUserDefaultsKey];
    
	return language;
}

// Resets the localization system, so it uses the OS default language.
//
// example call:
// LocalizationReset();
- (void)resetLocalization
{
    // set back to english
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"en" forKey:kJSLocalizedStringUserDefaultsKey];
    [defaults synchronize];
    
    // reset bundle
	_bundle = [NSBundle mainBundle];
}

@end
