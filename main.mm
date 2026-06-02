#import <UIKit/UIKit.h>

__attribute__((constructor))
static void init() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        UIWindow *window = UIApplication.sharedApplication.keyWindow;
        if (!window) return;

        UIView *box = [[UIView alloc] initWithFrame:CGRectMake(60, 200, 220, 120)];
        box.backgroundColor = UIColor.blackColor;
        box.layer.cornerRadius = 12;

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
        label.text = @"Moustache dylib loaded 🔥";
        label.textColor = UIColor.whiteColor;

        [box addSubview:label];
        [window addSubview:box];

        NSLog(@"Loaded successfully");
    });
}
