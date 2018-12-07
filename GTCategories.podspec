Pod::Spec.new do |s|
  s.name             = 'GTCategories'
  s.version          = '0.0.2'
  s.summary          = 'GTCategories 是一个通用Category拓展'
  s.homepage         = 'https://github.com/liuxc123/GTCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuxc123' => 'lxc_work@126.com' }
  s.source           = { :git => 'https://github.com/liuxc123/GTCategories.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.public_header_files = 'GTCategories/GTCategories.h'
  s.source_files = 'GTCategories/GTCategories.h'


  #Foundation
  s.subspec 'Foundation' do |foundation|
    foundation.public_header_files = 'GTCategories/Foundation/GTFoundationHeader.h'
    foundation.source_files = 'GTCategories/Foundation/GTFoundationHeader.h'
    foundation.frameworks = 'Foundation','Security'
    #三级
    foundation.subspec 'NSArray' do |array|
        array.source_files = 'GTCategories/Foundation/NSArray/*.{h,m}'
    end
    foundation.subspec 'NSBundle' do |bundle|
        bundle.source_files = 'GTCategories/Foundation/NSBundle/*.{h,m}'
    end
    foundation.subspec 'NSData' do |data|
        data.source_files = 'GTCategories/Foundation/NSData/*.{h,m}'
    end
    foundation.subspec 'NSDate' do |date|
        date.source_files = 'GTCategories/Foundation/NSDate/*.{h,m}'
    end
    foundation.subspec 'NSDateFormatter' do |dateformatter|
        dateformatter.source_files = 'GTCategories/Foundation/NSDateFormatter/*.{h,m}'
    end
    foundation.subspec 'NSDictionary' do |dictinoary|
        dictinoary.source_files = 'GTCategories/Foundation/NSDictionary/*.{h,m}'
    end
    foundation.subspec 'NSException' do |exception|
        exception.source_files = 'GTCategories/Foundation/NSException/*.{h,m}'
    end
    foundation.subspec 'NSFileManager' do |filemanager|
        filemanager.source_files = 'GTCategories/Foundation/NSFileManager/*.{h,m}'
    end
    foundation.subspec 'NSIndexPath' do |indexpath|
        indexpath.source_files = 'GTCategories/Foundation/NSIndexPath/*.{h,m}'
    end
    foundation.subspec 'NSInvocation' do |invocation|
        invocation.source_files = 'GTCategories/Foundation/NSInvocation/*.{h,m}'
    end
    foundation.subspec 'NSNotificationCenter' do |notificationcenter|
        notificationcenter.source_files = 'GTCategories/Foundation/NSNotificationCenter/*.{h,m}'
    end
    foundation.subspec 'NSNumber' do |number|
        number.source_files = 'GTCategories/Foundation/NSNumber/*.{h,m}'
    end
    foundation.subspec 'NSObject' do |object|
        object.source_files = 'GTCategories/Foundation/NSObject/*.{h,m}'
    end
    foundation.subspec 'NSRunLoop' do |runLoop|
        runLoop.source_files = 'GTCategories/Foundation/NSRunLoop/*.{h,m}'
    end
    foundation.subspec 'NSSet' do |set|
        set.source_files = 'GTCategories/Foundation/NSSet/*.{h,m}'
    end
    foundation.subspec 'NSString' do |string|
        string.source_files = 'GTCategories/Foundation/NSString/*.{h,m}'
        string.dependency 'GTCategories/Foundation/NSData'
    end
    foundation.subspec 'NSTimer' do |timer|
        timer.source_files = 'GTCategories/Foundation/NSTimer/*.{h,m}'
    end
    foundation.subspec 'NSURL' do |url|
        url.source_files = 'GTCategories/Foundation/NSURL/*.{h,m}'
    end
    foundation.subspec 'NSUserDefaults' do |userdefaults|
        userdefaults.source_files = 'GTCategories/Foundation/NSUserDefaults/*.{h,m}'
    end
  end

  #UIKit
  s.subspec 'UIKit' do |uikit|
    uikit.public_header_files = 'GTCategories/UIKit/GTUIKitHeader.h'
    uikit.source_files = 'GTCategories/UIKit/GTUIKitHeader.h'
    uikit.frameworks = 'UIKit'

    uikit.subspec 'UIApplication' do |application|
        application.source_files = 'GTCategories/UIKit/UIApplication/*.{h,m}'
    end
    uikit.subspec 'UIColor' do |color|
        color.source_files = 'GTCategories/UIKit/UIColor/*.{h,m}'
    end
    uikit.subspec 'UIControl' do |control|
        control.source_files = 'GTCategories/UIKit/UIControl/*.{h,m}'
    end
    uikit.subspec 'UIDevice' do |device|
        device.source_files = 'GTCategories/UIKit/UIDevice/*.{h,m}'
    end
    uikit.subspec 'UIFont' do |font|
        font.source_files = 'GTCategories/UIKit/UIFont/*.{h,m}'
    end
    uikit.subspec 'UIImage' do |image|
        image.source_files = 'GTCategories/UIKit/UIImage/*.{h,m}'
    end
    uikit.subspec 'UIResponder' do |responder|
        responder.source_files = 'GTCategories/UIKit/UIResponder/*.{h,m}'
    end
    uikit.subspec 'UIScreen' do |screen|
        screen.source_files = 'GTCategories/UIKit/UIScreen/*.{h,m}'
    end
    uikit.subspec 'UIScrollView' do |scrollview|
        scrollview.source_files = 'GTCategories/UIKit/UIScrollView/*.{h,m}'
    end
    uikit.subspec 'UISearchBar' do |searchbar|
        searchbar.source_files = 'GTCategories/UIKit/UISearchBar/*.{h,m}'
    end
    uikit.subspec 'UISplitViewController' do |splitviewcontroller|
        splitviewcontroller.source_files = 'GTCategories/UIKit/UISplitViewController/*.{h,m}'
    end
    uikit.subspec 'UITableViewCell' do |tableviewcell|
        tableviewcell.source_files = 'GTCategories/UIKit/UITableViewCell/*.{h,m}'
    end


    uikit.subspec 'UIView' do |view|
        view.source_files = 'GTCategories/UIKit/UIView/*.{h,m}'
    end
    uikit.subspec 'UIViewController' do |viewcontroller|
        viewcontroller.source_files = 'GTCategories/UIKit/UIViewController/*.{h,m}'
    end
    uikit.subspec 'UIWindow' do |window|
        window.source_files = 'GTCategories/UIKit/UIWindow/*.{h,m}'
    end
  end

  #QuartzCore
  s.subspec 'QuartzCore' do |quartzcore|
    # quartzcore.source_files = 'GTCategories/QuartzCore/**/*.{h,m}'
    quartzcore.public_header_files = 'GTCategories/QuartzCore/GTQuartzCoreHeader.h'
    quartzcore.source_files = 'GTCategories/QuartzCore/GTQuartzCoreHeader.h'
    quartzcore.frameworks = 'QuartzCore','UIKit'

    quartzcore.subspec 'CAAnimation' do |animation|
        animation.source_files = 'GTCategories/QuartzCore/CAAnimation/*.{h,m}'
    end
    quartzcore.subspec 'CALayer' do |layer|
        layer.source_files = 'GTCategories/QuartzCore/CALayer/*.{h,m}'
    end
    quartzcore.subspec 'CAMediaTimingFunction' do |mediatimingfunction|
        mediatimingfunction.source_files = 'GTCategories/QuartzCore/CAMediaTimingFunction/*.{h,m}'
    end
    quartzcore.subspec 'CAShapeLayer' do |shapelayer|
        shapelayer.source_files = 'GTCategories/QuartzCore/CAShapeLayer/*.{h,m}'
    end
    quartzcore.subspec 'CATransaction' do |transaction|
        transaction.source_files = 'GTCategories/QuartzCore/CATransaction/*.{h,m}'
    end
  end
end
