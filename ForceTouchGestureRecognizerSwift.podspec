Pod::Spec.new do |s|
  s.name         = 'ForceTouchGestureRecognizerSwift'
  s.version      = '0.1'
  s.homepage     = 'https://github.com/ashleymills/ForceTouchGestureRecognizer.swift'
  s.authors      = {
    'Ashley Mills' => 'ashleymills@mac.com'
  }
  s.summary      = 'Replacement for Apple\'s Reachability re-written in Swift with callbacks.'
  s.license      = { :type => 'MIT' }

# Source Info
  s.ios.platform = :ios, "9.0"
  s.ios.deployment_target = "8.0"
  s.source       =  {
    :git => 'https://github.com/ashleymills/ForceTouchGestureRecognizer.swift.git',
    :tag => 'v'+s.version.to_s
  }
  s.source_files = 'ForceTouchGestureRecognizer.swift'

  s.requires_arc = true
end
