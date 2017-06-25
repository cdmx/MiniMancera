import UIKit

class MHomeOptionsWhistlesVsZombies:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(key:"MHomeOptionsWhistlesVsZombies_title")
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
        
        let controller:COptionWhistlesVsZombies = COptionWhistlesVsZombies(dataOption:dataOption)
        
        return controller
    }*/
}
