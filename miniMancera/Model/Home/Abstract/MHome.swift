import Foundation

class MHome
{
    private(set) var options:[MHomeOptionsProtocol]
    let footer:[MHomeFooterProtocol]
    
    private class func factoryOptions() -> [MHomeOptionsProtocol]
    {
        var options:[MHomeOptionsProtocol] = []
        
        guard
            
            let dataOptions:[DOption] = MSession.sharedInstance.settings?.options?.array as? [DOption]
        
        else
        {
            return options
        }
        
        for dataOption:DOption in dataOptions
        {
            guard
            
                let optionsClassString:String = dataOption.optionsClass,
                let optionsClass:AnyClass = NSClassFromString(optionsClassString),
                let optionsType:MHomeOptionsProtocol.Type = optionsClass as? MHomeOptionsProtocol.Type
            
            else
            {
                continue
            }
            
            let option:MHomeOptionsProtocol = optionsType.init(dataOption:dataOption)
            options.append(option)
        }
        
        return options
    }
    
    private class func factoryFooter() -> [MHomeFooterProtocol]
    {
        let footerSettings:MHomeFooterSettings = MHomeFooterSettings()
        let footerBoards:MHomeFooterBoards = MHomeFooterBoards()
        let footerStore:MHomeFooterStore = MHomeFooterStore()
        
        let footer:[MHomeFooterProtocol] = [
            footerSettings,
            footerBoards,
            footerStore]
        
        return footer
    }
    
    init()
    {
        options = []
        footer = MHome.factoryFooter()
    }
    
    //MARK: public
    
    func refreshOptions()
    {
        options = MHome.factoryOptions()
    }
}
