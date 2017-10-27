import UIKit

extension UIImage {
  
  func tintWithLinearGradientColors(colorsArr: [CGColor?]) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
    let context = UIGraphicsGetCurrentContext()
    
    context!.translateBy(x: 0, y: self.size.height)
    context!.scaleBy(x: 1.0, y: -1.0)
    
    context!.setBlendMode(.normal)
    let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    
    let colors = colorsArr as CFArray
    let space = CGColorSpaceCreateDeviceRGB()
    let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)
    
    context?.clip(to: rect, mask: self.cgImage!)
    context!.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: self.size.height), options: CGGradientDrawingOptions(rawValue: 0))
    let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return gradientImage!
  }
  
}
