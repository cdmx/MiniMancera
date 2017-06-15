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
        options = MHome.factoryOptions()
        footer = MHome.factoryFooter()
    }
}
