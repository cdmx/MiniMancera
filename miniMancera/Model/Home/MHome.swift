import Foundation

class MHome
{
    let options:[MHomeOptionsProtocol]
    let footer:[MHomeFooterProtocol]
    
    private class func factoryOptions() -> [MHomeOptionsProtocol]
    {
        let optionReformaCrossing:MHomeOptionsReformaCrossing = MHomeOptionsReformaCrossing()
        
        let options:[MHomeOptionsProtocol] = [
            optionReformaCrossing]
        
        return options
    }
    
    private class func factoryFooter() -> [MHomeFooterProtocol]
    {
        let
    }
    
    init()
    {
        options = MHome.factoryOptions()
        footer = MHome.factoryFooter()
    }
}
