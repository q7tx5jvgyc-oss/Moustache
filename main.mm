#import <UIKit/UIKit.h>

static BOOL isEnabled = NO;
static float speedValue = 1.0;

@interface FloatingMenu : UIView
@end

@implementation FloatingMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        self.layer.cornerRadius = 12;

        UIButton *toggle = [UIButton buttonWithType:UIButtonTypeSystem];
        toggle.frame = CGRectMake(10, 10, 80, 30);
        [toggle setTitle:@"Start" forState:UIControlStateNormal];
        [toggle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [toggle addTarget:self action:@selector(toggleAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:toggle];

        UIButton *stop = [UIButton buttonWithType:UIButtonTypeSystem];
        stop.frame = CGRectMake(100, 10, 80, 30);
        [stop setTitle:@"Stop" forState:UIControlStateNormal];
        [stop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [stop addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:stop];

        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 60, 170, 20)];
        slider.minimumValue = 0.5;
        slider.maximumValue = 3.0;
        slider.value = 1.0;
        [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
    }

    return self;
}

- (void)toggleAction:(UIButton *)btn {
    isEnabled = YES;
    NSLog(@"Started");
}

- (void)stopAction:(UIButton *)btn {
    isEnabled = NO;
    NSLog(@"Stopped");
}

- (void)sliderChanged:(UISlider *)slider {
    speedValue = slider.value;
    NSLog(@"Speed: %f", speedValue);
}

@end

__attribute__((constructor))
static void init_tweak() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIWindow *window = UIApplication.sharedApplication.keyWindow;
        if (!window) return;

        FloatingMenu *menu = [[FloatingMenu alloc] initWithFrame:CGRectMake(50, 150, 200, 100)];
        [window addSubview:menu];

        NSLog(@"Menu Loaded");
    });
}
