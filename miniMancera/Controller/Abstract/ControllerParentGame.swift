import UIKit
import GameKit

extension ControllerParent:GKGameCenterControllerDelegate
{
    //MARK: private
    
    private func gameControllerAuthHandler(controller:UIViewController?, error:Error?)
    {
        guard
        
            let controller:UIViewController = controller
        
        else
        {
            return
        }
        
        present(controller, animated:false, completion:nil)
    }
    
    private func asyncGameScore(score:Int, gameId:String)
    {
        let localPlayer:GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        if localPlayer.isAuthenticated
        {
            let report:GKScore = GKScore(leaderboardIdentifier:gameId)
            report.value = Int64(score)
            let scores:[GKScore] = [report]
            
            GKScore.report(scores, withCompletionHandler:nil)
        }
    }
    
    //MARK: notifications
    
    func notifiedEnterForeground(sender notification:Notification)
    {
        let warning:String = "remove comments"
//        let localPlayer:GKLocalPlayer = GKLocalPlayer.localPlayer()
//        localPlayer.authenticateHandler = gameControllerAuthHandler(controller:error:)
    }
    
    //MARK: public
    
    func gameLeaderBoards() -> Bool
    {
        let localPlayer:GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        if localPlayer.isAuthenticated
        {
            let controller:GKGameCenterViewController = GKGameCenterViewController()
            controller.gameCenterDelegate = self
            controller.leaderboardTimeScope = GKLeaderboardTimeScope.allTime
            controller.viewState = GKGameCenterViewControllerState.leaderboards
            
            present(controller, animated:true, completion:nil)
            
            return true
        }
        
        return false
    }
    
    func gameScore(score:Int, gameId:String)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncGameScore(score:score, gameId:gameId)
        }
    }
    
    //MARK: game delegate
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController:GKGameCenterViewController)
    {
        dismiss(animated:true, completion:nil)
    }
}
