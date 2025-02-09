# Flutter Deep Linking Implementation Guide

This repository demonstrates two popular approaches to implementing deep linking in Flutter applications using GoRouter and AutoRoute. Both implementations offer different features and trade-offs for handling deep links.

## Table of Contents
- [Testing Deep Links](#testing-deep-links)
- [GoRouter Implementation](#gorouter-implementation)
- [AutoRoute Implementation](#autoroute-implementation)
- [Comparison](#comparison)

## Testing Deep Links

### Android Testing
1. Using adb command line:
```bash
# Format: adb shell am start -a android.intent.action.VIEW -d "your-scheme://path"
adb shell am start -a android.intent.action.VIEW -d "myapp://products/123"
```

2. Using Android Studio:
- Open Tools > App Links Assistant
- Select "Test URL Mapping"
- Enter your deep link URL
- Click "Test"

### iOS Testing
1. Using xcrun:
```bash
xcrun simctl openurl booted "myapp://products/123"
```

2. Using Safari:
- Type your deep link URL directly in Safari
- Or create an HTML file with links:
```html
<a href="myapp://products/123">Open Product 123</a>
```

## GoRouter Implementation

### Key Features
- Built-in deep link support
- Simple configuration
- Path parameters support
- Nested routing
- Error handling

### Testing GoRouter Deep Links

1. Configure URL schemes in native platforms:

**iOS (ios/Runner/Info.plist):**
```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>myapp</string>
        </array>
    </dict>
</array>
```

**Android (android/app/src/main/AndroidManifest.xml):**
```xml
<activity>
    <!-- Deep linking -->
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="myapp" />
    </intent-filter>
</activity>
```

2. Test deep link examples:
```
myapp://example.com/product/123
myapp://example.com/category/electronics
myapp://example.com/user/john_doe
myapp://example.com/product/123/reviews
```

## AutoRoute Implementation

### Key Features
- Code generation for type-safe routing
- Deep link transformation
- Deep link validation
- Guard support
- Path parameters support

### Testing AutoRoute Deep Links

1. Configure platform-specific settings (same as GoRouter)

2. Additional configuration for AutoRoute:
```dart
// Add to pubspec.yaml
dependencies:
  auto_route: ^[version]
  
dev_dependencies:
  auto_route_generator: ^[version]
  build_runner: ^[version]
```

3. Generate routes:
```bash
flutter pub run build_runner build
```

4. Test deep link examples:
```
myapp://products/123
myapp://profile
myapp://mobile/products/123 (will be transformed)
```

## Comparison

### GoRouter Advantages
1. **Simplicity**
   - Easier to set up and configure
   - Less boilerplate code
   - No code generation required
   - Intuitive API

2. **Built-in Features**
   - Native deep linking support
   - Built-in error handling
   - Simple path parameters
   - Query parameters support

3. **Learning Curve**
   - Shorter learning curve
   - Good documentation
   - Large community support

### AutoRoute Advantages
1. **Type Safety**
   - Compile-time route checking
   - Type-safe parameters
   - Reduced runtime errors

2. **Advanced Features**
   - Deep link transformation
   - Deep link validation
   - Guard support
   - Path parameters type conversion
   - More control over navigation behavior

3. **Scalability**
   - Better for large applications
   - More organized route management
   - Enhanced maintainability

### When to Choose Which?

Choose **GoRouter** if:
- You need a simple, straightforward routing solution
- Your app has basic to moderate routing requirements
- You want to avoid code generation
- You prefer less boilerplate code
- You're building a smaller to medium-sized application

Choose **AutoRoute** if:
- You need type-safe routing
- Your app has complex routing requirements
- You need advanced deep link handling (transformation, validation)
- You're building a large-scale application
- You need fine-grained control over navigation
- You want to implement route guards

## Best Practices
1. Always test deep links on both Android and iOS
2. Handle error cases gracefully
3. Implement proper URL scheme validation
4. Test edge cases (malformed URLs, missing parameters)
5. Consider implementing analytics for deep link tracking
6. Document your deep link structure
7. Maintain a consistent URL scheme across platforms