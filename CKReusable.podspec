Pod::Spec.new do |spec|
  spec.name         = 'CKReusable'
  spec.version      = '1.1.0'
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

  spec.source_files   = 'Reusable/Sources/**/*.swift', 'Reusable/Reusable.h'
  spec.public_header_files = 'Reusable/Reusable.h'
  spec.ios.framework  = 'UIKit'
  spec.module_name = 'Reusable'

end
