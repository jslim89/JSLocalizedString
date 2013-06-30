JSLocalizedString
-----------------

## Requirements

* This project is using ARC and tested in iOS 4.3, if your project is using non-ARC, in your project target -> **Build Phases** -> **Compile Sources**, add `-fobjc-arc` to _Compiler Flags_ in _JSLocalizedString.m_

## Install:

1. Create a file named **Localizable.strings** in your project.
2. Go to **Project** -> **Info** -> **Localizations** section, add a new language that you want.
    * ![alt text] (https://raw.github.com/jslim89/JSLocalizedString/master/screenshots/add-localization.png "Add more language")
3. Drag the **JSLocalizedString** (inside the **Libraries** folder) to your project.
    * Check the option **Copy items into destination group's folder (if needed)**
    * Choose **Create groups for any added folders**
    * Add to project target
4. Select your file you created just now **Localizable.strings**, localize it
    * ![alt text] (https://raw.github.com/jslim89/JSLocalizedString/master/screenshots/localize-the-file.png "Localize the file")
5. Under your **Supporting Files**, edit **<your-project-name>-Prefix.pch**, add `#import "JSLocalizedString.h"` so that you can use this in whole project _(import globally)_.
6. You're done.

## Usage:
1. You can set language by calling `JSSetLanguage(@"en");`, then it will look for the en.lproj folder.
2. `self.navigationItem.title = JSLocalizedString(@"Settings", @"Localized bar title: Settings");` this is similar to `NSLocalizedString`
3. You can look the demo project for more info.

## Credits:
* Inspired by [Custom localization system for your iphone games](http://aggressive-mediocrity.blogspot.com/2010/03/custom-localization-system-for-your.html)

## References:
* [How to force NSLocalizedString to use a specific language](http://stackoverflow.com/questions/1669645/how-to-force-nslocalizedstring-to-use-a-specific-language)

