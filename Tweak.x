#import <UIKit/UIKit.h>

// Объявляем системные функции проверки MobileGestalt
FOUNDATION_EXTERN BOOL MGGetBoolAnswer(NSString *key);
FOUNDATION_EXTERN NSInteger MGGetSInt32Answer(NSString *key, NSInteger defaultValue);

// 1. Хук на логические (Да/Нет) вопросы системы
%hookf(BOOL, MGGetBoolAnswer, NSString *key) {
    // Главный ключ поддержки Always-On Display
    if ([key isEqualToString:@"Id9b9RRYgS"]) {
        return YES; 
    }
    // Ключ, разрешающий использовать низкую частоту экрана (1 Гц) в режиме сна
    if ([key isEqualToString:@"S8Xv9v9qfA"]) {
        return YES;
    }
    return %orig(key);
}

// 2. Хук на числовые вопросы системы (обманываем тип устройства)
%hookf(NSInteger, MGGetSInt32Answer, NSString *key, NSInteger defaultValue) {
    // Если система проверяет субтип устройства (ArtworkDeviceSubtype)
    if ([key isEqualToString:@"ArtworkDeviceSubtype"]) {
        // Притворяемся iPhone 14 Pro (у него код 2796), чтобы iOS открыла все Pro-функции!
        return 2796; 
    }
    return %orig(key, defaultValue);
}
