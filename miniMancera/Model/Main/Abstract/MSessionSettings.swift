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
                addGame(game:game)
            }
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
    
    private func addGame(game:MGameProtocol)
    {
        
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
