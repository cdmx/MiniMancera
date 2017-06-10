import UIKit

class MHomeDelete:MHomeProtocol
{
    var icon:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericDelete")
        }
    }
    
    func selected(controller:CHome, model:MHomeItem)
    {
        controller.deleteNote(item:model)
    }
}
