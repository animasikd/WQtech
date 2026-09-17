#import <UIKit/UIKit.h>

// Объявляем оригинальную функцию проверки MobileGestalt
FOUNDATION_EXTERN BOOL MGGetBoolAnswer(NSString *key);

// Создаем хук (перехватчик) на эту функцию
%hookf(BOOL, MGGetBoolAnswer, NSString *key) {
    // Если система спрашивает про ключ оригинального Always-On Display
    if ([key isEqualToString:@"Id9b9RRYgS"]) {
        return YES; // Отвечаем: "Да, этот Айфон поддерживает AOD!"
    }
    // Для всех остальных ключей возвращаем стандартные значения системы
    return %orig(key);
}