import UIKit

class MHomeOptionsWhistlesVsZombies:MHomeOptions
{
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
    }
}
