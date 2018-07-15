

Pod::Spec.new do |s|
  s.name             = 'XCShareManager'
  s.version          = '0.0.3'
  
  s.summary          = <<-DESC
  封装分享功能，关于白名单和URLschemes请自行配置。
  目前已经集成了 WeChat、QQ、Sina 这三个平台的分享功能，默认这三个全部集成，如果不享集成其中的某个，请使用：
      不集成新浪的SDK： NO_SIAN=1 pod install
      不集成微信的SDK： NO_WECHAT=1 pod install
      不集成QQ的SDK：  NO_QQ=1 pod install
                          DESC

  s.description      = <<-DESC
        XCShareManager. 封装分享功能，关于白名单和URLschemes请自行配置。
        目前已经集成了 WeChat、QQ、Sina 这三个平台的分享功能，默认这三个全部集成，如果不享集成其中的某个，请使用：
            不集成新浪的SDK： NO_SIAN=1 pod install
            不集成微信的SDK： NO_WECHAT=1 pod install
            不集成QQ的SDK：  NO_QQ=1 pod install
                       DESC

  s.homepage         = 'https://github.com/fanxiaocong/XCShareManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaocong' => '1016697223@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaocong/XCShareManager.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.3'

  s.static_framework = true
  s.subspec 'XCShareManager' do |mgr|
      mgr.source_files = 'XCShareManager/Classes/XCShareManager/*.{h,m}',
                         'XCShareManager/Classes/XCShareManager/XCShareProtocol/*.{h}',
                         'XCShareManager/Classes/XCShareManager/XCShareUI/*.{h,m}'
      mgr.resource_bundles = {
        'XCShareManager' => ['XCShareManager/Assets/*.png']
      }
                         
  end


  #  友盟分享
  s.subspec 'UMengShare' do |umeng|
      umeng.source_files = 'XCShareManager/Classes/UMengShare/*.{h,m}'
      umeng.dependency  'XCShareManager/XCShareManager'

      if ENV['NO_WECHAT']
          # 不集成微信
      else
          # 集成微信(精简版0.2M)
          umeng.dependency 'UMengUShare/Social/ReducedWeChat'
      end

      if ENV['NO_QQ']
          # 不集成QQ/QZone
      else
          # 集成QQ/QZone/TIM(精简版0.5M)
          umeng.dependency 'UMengUShare/Social/ReducedQQ'
      end

      if ENV['NO_SINA']
          # 不集成新浪微博
      else
          # 集成新浪微博(精简版1M)
          umeng.dependency 'UMengUShare/Social/ReducedSina'
      end
  end
  
  
  # ShareSDK
  s.subspec 'MobShare' do |mob|
      mob.source_files = 'XCShareManager/Classes/MobShare/*.{h,m}'
      mob.dependency  'XCShareManager/XCShareManager'
      
      if ENV['NO_WECHAT']
          # 不集成微信
          else
          # 集成微信
          mob.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChat'
      end
      
      if ENV['NO_QQ']
          # 不集成QQ/QZone
          else
          # 集成QQ/QZone/TIM
          mob.dependency 'mob_sharesdk/ShareSDKPlatforms/QQ'
      end
      
      if ENV['NO_SINA']
          # 不集成新浪微博
          else
          # 集成新浪微博
          mob.dependency 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'
      end
  end

end
