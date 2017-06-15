import UIKit

protocol MHomeFooterProtocol
{
    var title:String { get }
    var image:UIImage { get }
    func selected(controller:CHome)
}
