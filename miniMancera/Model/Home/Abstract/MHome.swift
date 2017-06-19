import Foundation

class MHome
{
    private(set) var options:[MHomeOptions]
    let footer:[MHomeFooterProtocol]
    
    private class func factoryOptions() -> [MHomeOptions]
    {
        var options:[MHomeOptions] = []
        
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
                let optionsType:MHomeOptions.Type = optionsClass as? MHomeOptions.Type
            
            else
            {
                continue
            }
            
            let option:MHomeOptions = optionsType.init(dataOption:dataOption)
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
    
    func purchaseOptions() -> [MHomeOptions]
    {
        var options:[MHomeOptions] = []
        
        for option:MHomeOptions in self.options
        {
            guard
            
                let _:DOptionPurchase = option.dataOption as? DOptionPurchase
            
            else
            {
                continue
            }
            
            options.append(option)
        }
        
        return options
    }
}
