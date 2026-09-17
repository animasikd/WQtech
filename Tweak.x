#import <UIKit/UIKit.h>

// Подключаемся к системным кружочкам уведомлений в iOS
%hook SBIconBadgeView

- (void)layoutSubviews {
    %orig; // Оставляем стандартную работу системы

    // Находим фоновую картинку кружочка
    UIView *backgroundView = [self valueForKey:@"_backgroundView"];
    if (backgroundView) {
        // Включаем бесконечный плавный перелив из голубого в фиолетовый неон!
        [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
            backgroundView.backgroundColor = [UIColor systemCyanColor];
        } completion:nil];
        
        [UIView animateWithDuration:3.0 delay:1.5 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
            backgroundView.backgroundColor = [UIColor systemPurpleColor];
        } completion:nil];
    }
}

%end