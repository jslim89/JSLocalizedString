//
//  Ref: http://aggressive-mediocrity.blogspot.com/2010/03/custom-localization-system-for-your.html
//
//  JSLocalizedString.h
//  JsLocalizedString
//
//  Created by JS Lim on 6/29/13.
//  Copyright (c) 2013 Js Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JSLocalizedString(key, comment) \
[[JSLocalizedString sharedLocalizableSystem] localizedStringForKey:(key) value:(comment)]

#define JSSetLanguage(language) \
[[JSLocalizedString sharedLocalizableSystem] setLanguage:(language)]

#define JSGetLanguage() \
[[JSLocalizedString sharedLocalizableSystem] getLanguage]

#define JSLocalizationReset() \
[[JSLocalizedString sharedLocalizableSystem] resetLocalization]

@interface JSLocalizedString : NSObject

// a shared instance
+ (JSLocalizedString *)sharedLocalizableSystem;

//gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

//sets the language
- (void)setLanguage:(NSString*)language;

//gets the current language
- (NSString *)getLanguage;

//resets this system.
- (void)resetLocalization;

@end
