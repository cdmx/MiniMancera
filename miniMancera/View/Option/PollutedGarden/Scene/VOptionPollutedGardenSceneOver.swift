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
        let background:VOptionPollutedGardenBackground = VOptionPollutedGardenBackground(
            controller:controller)
        
        let title:VOptionPollutedGardenGameOverTitle = VOptionPollutedGardenGameOverTitle()
        let descr:VOptionPollutedGardenGameOverDescr = VOptionPollutedGardenGameOverDescr()
        let title1up:VOptionPollutedGardenGameOverTitle1up = VOptionPollutedGardenGameOverTitle1up()
        let titleExit:VOptionPollutedGardenGameOverTitleExit = VOptionPollutedGardenGameOverTitleExit()
        
        let player:VOptionPollutedGardenGameOverPlayer = VOptionPollutedGardenGameOverPlayer(
            controller:controller)
        
        let button1up:VOptionPollutedGardenGameOver1up = VOptionPollutedGardenGameOver1up(
            controller:controller)
        
        let buttonExit:VOptionPollutedGardenGameOverExit = VOptionPollutedGardenGameOverExit(
            controller:controller)
        
        addChild(background)
        addChild(title)
        addChild(descr)
        addChild(title1up)
        addChild(titleExit)
        addChild(player)
        addChild(button1up)
        addChild(buttonExit)
    }
}
