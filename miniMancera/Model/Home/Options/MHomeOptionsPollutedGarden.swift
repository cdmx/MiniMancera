import UIKit

class MHomeOptionsPollutedGarden:MHomeOptionsPurchase
{   
    override func selected() -> UIViewController?
    {
        guard
            
            let dataOption:DOption = self.dataOption
            
        else
        {
            return nil
        }
        
        let controller:COptionReformaCrossing = COptionReformaCrossing(dataOption:dataOption)
        
        return controller
    }
}
