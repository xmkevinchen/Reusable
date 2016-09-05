Pod::Spec.new do |spec|
  spec.name         = 'Reusable'
  spec.version      = '1.0.0'
  spec.license      = 'MIT'
  spec.homepage     = 'https://github.com/xmkevinchen/Reusable'
  spec.authors      = { 'Kevin Chen' => 'xmkevinchen@gmail.com' }
  spec.summary      = 'A Swift type safer resuable view, such as UITableViewCell, UICollectionViewCell, UIViewController, without downcasting'
  spec.source       = {
                        :git => 'https://github.com/xmkevinchen/Reusable.git',                        
                        :tag => spec.version.to_s
                      }

  spec.platform              = :ios
  spec.ios.deployment_target = '8.0'

  spec.source_files   = 'Reusable/Sources/**/*.swift'
  spec.ios.framework  = 'UIKit'

end
