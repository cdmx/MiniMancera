import Foundation

class VOptionPollutedGardenSceneOver:ViewGameScene<MOptionPollutedGarden>
{
    required init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        super.init(controller:controller)
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let textures:MOptionPollutedGardenTextures = controller.model.textures
        
        let background:VOptionPollutedGardenBackground = VOptionPollutedGardenBackground(
            controller:controller)
        
        let info:ViewGameNodeGameOverInfo = ViewGameNodeGameOverInfo(
            title:String.localizedPollutedGarden(
                key:"VOptionPollutedGardenSceneOver_infoTitle"),
            descr:String.localizedPollutedGarden(
                key:"VOptionPollutedGardenSceneOver_infoDescr"),
            zPosition:MOptionPollutedGardenZPosition.GameOverInfo.rawValue)
        
        let title1up:ViewGameNodeGameOverTitle1up = ViewGameNodeGameOverTitle1up(
            text:String.localizedPollutedGarden(
                key:"VOptionPollutedGardenSceneOver_1up"),
            zPosition:MOptionPollutedGardenZPosition.GameOverTitle1up.rawValue)
        let titleExit:ViewGameNodeGameOverTitleExit = ViewGameNodeGameOverTitleExit(
            text:String.localizedPollutedGarden(
                key:"VOptionPollutedGardenSceneOver_exit"),
            zPosition:MOptionPollutedGardenZPosition.GameOverTitleExit.rawValue)
        
        let player:ViewGameNodeGameOverPlayer<MOptionPollutedGarden> = ViewGameNodeGameOverPlayer<MOptionPollutedGarden>(
            controller:controller,
            texture:textures.playerDefeated)
        
        let button1up:ViewGameNodeGameOver1up<MOptionPollutedGarden> = ViewGameNodeGameOver1up<MOptionPollutedGarden>(
            controller:controller,
            texture:textures.gameOver1up)
        
        let buttonExit:ViewGameNodeGameOverExit<MOptionPollutedGarden> = ViewGameNodeGameOverExit<MOptionPollutedGarden>(
            controller:controller,
            texture:textures.gameOverExit)
        
        addChild(background)
        addChild(info)
        addChild(title1up)
        addChild(titleExit)
        addChild(player)
        addChild(button1up)
        addChild(buttonExit)
    }
}
