import UIKit

class MHomeEdit:MHomeProtocol
{
    var icon:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericEdit")
        }
    }
    
    func selected(controller:CHome, model:MHomeItem)
    {
        controller.editNote(item:model)
    }
}
