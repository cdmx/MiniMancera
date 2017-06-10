import UIKit

protocol MHomeProtocol
{
    var icon:UIImage { get }
    func selected(controller:CHome, model:MHomeItem)
}
