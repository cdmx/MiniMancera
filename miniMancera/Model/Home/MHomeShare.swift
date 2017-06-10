import UIKit

class MHomeShare:MHomeProtocol
{
    var icon:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericShare")
        }
    }
    
    func selected(controller:CHome, model:MHomeItem)
    {
        controller.shareNote(item:model)
    }
}
