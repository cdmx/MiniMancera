import UIKit

class MHomeOptionsPollutedGarden:MHomeOptionsPurchase
{
    override var title:String?
    {
        get
        {
            return String.localizedPollutedGarden(key:"MHomeOptionsPollutedGarden_title")
        }
    }
    
    override var thumbnail:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenThumbnail")
        }
    }
    
    override func selected() -> UIViewController?
    {
        guard
            
            let dataOption:DOption = self.dataOption
            
        else
        {
            return nil
        }
        
        let controller:COptionPollutedGarden = COptionPollutedGarden(dataOption:dataOption)
        
        return controller
    }
}
