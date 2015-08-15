
Pod::Spec.new do |s|

  s.name         = "NKWatchActivityIndicator"
  s.version      = "0.1.0"
  s.summary      = "An activity indicator library for Apple Watch and a sample to push the limit of animation in watchOS 2. "

  s.description  = <<-DESC

                   An activity indicator library for Apple Watch and a sample to push the limit of animation in watchOS 2.
                   We are trying to implement beautiful indicators in this fork of DGActivityIndicatorView and support ball scale, ball scale ripple, tow dots, three dots, ball zigzag, ball zigzag deflect animations now and will integrate more.

                   DESC

  s.homepage     = "https://github.com/NilStack/NKWatchActivityIndicator"
  s.screenshots  = "https://db.tt/UAWEZ1AF"
  s.license      = "MIT"
  s.author       = { "Peng Guo" => "guoleii@gmail.com" }
  s.social_media_url   = "http://twitter.com/NilStack"
  s.watchos.deployment_target = "2.0"
  s.source       = { :git => "https://github.com/NilStack/NKWatchActivityIndicator.git", :tag => s.version.to_s }
  s.watchos.source_files  = "NKWatchActivityIndicator/*.{h,m}", "NKWatchActivityIndicator/Animations/*.{h,m}"
  s.frameworks = "UIKit", "WatchKit"
  s.requires_arc = true

end
