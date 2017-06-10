import Foundation

class MHome
{
    let options:[MHomeOptionsProtocol]
    
    private class func factoryOptions() -> [MHomeOptionsProtocol]
    {
        let optionReformaCrossing:MHomeOptionsReformaCrossing = MHomeOptionsReformaCrossing()
        
        let options:[MHomeOptionsProtocol] = [
            optionReformaCrossing]
        
        return options
    }
    
    init()
    {
        options = MHome.factoryOptions()
    }
}
