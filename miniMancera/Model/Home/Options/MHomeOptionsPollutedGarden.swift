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
        
        let controller:COptionPollutedGarden = COptionPollutedGarden(dataOption:dataOption)
        
        return controller
    }
}
