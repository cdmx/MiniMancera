import Foundation

extension MSession
{
    //MARK: private
    
    private func asyncLoadSession()
    {
        DManager.sharedInstance?.fetchData(
            entityName:DSettings.entityName)
        { (data) in
            
            guard
            
                let settings:DSettings = data?.first as? DSettings
            
            else
            {
                self.createSession()
                
                return
            }
            
            settings.addTtl()
            
            self.loadGames(settings:settings)
        }
    }
    
    private func createSession()
    {
        DManager.sharedInstance?.createData(
            entityName:DSettings.entityName)
        { (data) in
            
            guard
            
                let settings:DSettings = data as? DSettings
            
            else
            {
                return
            }
            
            self.loadGames(settings:settings)
        }
    }
    
    private func loadGames(settings:DSettings)
    {
        let dispatchGroup:DispatchGroup = DispatchGroup()
        dispatchGroup.setTarget(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        guard
            
            let options:[DOption] = settings.options?.array as? [DOption]
        
        else
        {
            return
        }
        
        settingsLoaded(settings:settings)
        
        let games:[MGameProtocol] = MGameFactory.factoryGames()
     
        for game:MGameProtocol in games
        {
            let shouldAdd:Bool = shouldAddGame(game:game, options:options)
            
            if shouldAdd
            {
                addGame(game:game, dispatchGroup:dispatchGroup)
            }
        }
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        { [weak self] in
            
            self?.finishLoadingSession()
        }
    }
    
    private func shouldAddGame(game:MGameProtocol, options:[DOption]) -> Bool
    {
        let gameId:String = game.gameId
        
        for option:DOption in options
        {
            if option.gameId == gameId
            {
                return false
            }
        }
        
        return true
    }
    
    private func addGame(game:MGameProtocol, dispatchGroup:DispatchGroup)
    {
        if let gameFree:MGameFreeProtocol = game as? MGameFreeProtocol
        {
            addGameFree(game:gameFree, dispatchGroup:dispatchGroup)
        }
        else if let gamePurchase:MGamePurchaseProtocol = game as? MGamePurchaseProtocol
        {
            addGamePurchase(game:gamePurchase, dispatchGroup:dispatchGroup)
        }
    }
    
    private func addGameFree(game:MGameFreeProtocol, dispatchGroup:DispatchGroup)
    {
        dispatchGroup.enter()
        
        let optionsClass:String = optionsClassFor(game:game)
        
        DManager.sharedInstance?.createData(
            entityName:DOptionFree.entityName)
        { (data) in
            
            guard
            
                let option:DOptionFree = data as? DOptionFree
            
            else
            {
                return
            }
            
            option.gameId = game.gameId
            option.optionsClass = optionsClass
            
            self.settings?.addToOptions(option)
            
            dispatchGroup.leave()
        }
    }
    
    private func addGamePurchase(game:MGamePurchaseProtocol, dispatchGroup:DispatchGroup)
    {
        dispatchGroup.enter()
        
        let optionsClass:String = optionsClassFor(game:game)
        
        DManager.sharedInstance?.createData(
            entityName:DOptionPurchase.entityName)
        { (data) in
            
            guard
                
                let option:DOptionPurchase = data as? DOptionPurchase
                
            else
            {
                return
            }
            
            option.gameId = game.gameId
            option.optionsClass = optionsClass
            option.purchaseId = game.purchaseId
            
            self.settings?.addToOptions(option)
            
            dispatchGroup.leave()
        }
    }
    
    private func optionsClassFor(game:MGameProtocol) -> String
    {
        let objectClass:AnyClass = object_getClass(game.optionsClass)
        let classString:String = NSStringFromClass(objectClass)
        
        return classString
    }
    
    private func finishLoadingSession()
    {
        DManager.sharedInstance?.save()
        
        NotificationCenter.default.post(
            name:Notification.sessionLoaded,
            object:nil)
    }
    
    //MARK: public
    
    func loadSession()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadSession()
        }
    }
}
