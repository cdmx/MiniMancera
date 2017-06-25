import UIKit

class MHomeOptionsPollutedGarden:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedPollutedGarden(key:"MHomeOptionsPollutedGarden_title")
        }
    }
    
    override var descr:String?
    {
        get
        {
            return String.localizedPollutedGarden(key:"MHomeOptionsPollutedGarden_descr")
        }
    }
    
    override var thumbnail:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenThumbnail")
        }
    }
    
    override var splashImage:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenSplash")
        }
    }
    
    override var scoreIcon:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenScore")
        }
    }
    /*
    override func gameController() -> UIViewController?
    {
        guard
            
            let dataOption:DOption = self.dataOption
            
        else
        {
            return nil
        }
        
        let controller:COptionPollutedGarden = COptionPollutedGarden(dataOption:dataOption)
        
        return controller
    }*/
}
