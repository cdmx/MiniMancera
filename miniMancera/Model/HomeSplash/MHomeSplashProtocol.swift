import UIKit

protocol MHomeSplashProtocol
{
    var reusableIdentifier:String { get }
    func cellHeightFor(width:CGFloat) -> CGFloat
}
