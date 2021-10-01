pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Governance.sol";
import "./interfaces/IGeneralNFTReward.sol";
import "./interfaces/IPosiTreasury.sol";

/**
 * A contract to update reward for NFT pool every 7 days
 */
contract InsuranceFundV1 is Governance {
    IGeneralNFTReward public generalNFTReward = IGeneralNFTReward(0xbE9FF181BFA9dd78191B81B23Fd4ff774a3fB4F1);
    IERC20 public posi = IERC20(0x5CA42204cDaa70d5c773946e69dE942b85CA6706);
    IPosiTreasury public treasury = IPosiTreasury(0xF7224c91BaF653ef46F498a92E2FFF35Ad0588a2);

    function approve() public {
        posi.approve(address(generalNFTReward), type(uint256).max);
    }

    // set new rewards distributing in 7 days for GeneralNFTRewards
    // only governance can call
    function notifyReward(uint256 amount) external onlyGovernance {
        require(block.timestamp >= generalNFTReward._periodFinish(), "Not time to reset");
        if(posi.balanceOf(address(this)) < amount){
            treasury.mint(address(this), amount);
        }
        generalNFTReward.notifyReward(amount);
    }

    // change GeneralNFTRewards
    function changeGeneralNFTGovernance(address governance) external onlyGovernance {
        generalNFTReward.setGovernance(governance);
    }
    function setTeamRewardRate( uint256 teamRewardRate ) external onlyGovernance {
        generalNFTReward.setTeamRewardRate( teamRewardRate);
    }
    function setPoolRewardRate( uint256  poolRewardRate ) external onlyGovernance {
        generalNFTReward.setPoolRewardRate( poolRewardRate);
    }
    function setHarvestInterval( uint256  harvestInterval ) external onlyGovernance {
        generalNFTReward.setHarvestInterval( harvestInterval);
    }
    function setRewardPool( address  rewardPool ) external onlyGovernance {
        generalNFTReward.setRewardPool(rewardPool);
    }
    function setTeamWallet( address teamwallet ) external onlyGovernance {
        generalNFTReward.setTeamWallet( teamwallet);
    }
    function setWithDrawPunishTime( uint256  punishTime ) external onlyGovernance {
        generalNFTReward.setWithDrawPunishTime( punishTime);
    }
    function setMaxStakedDego(uint256 amount) external onlyGovernance {
        generalNFTReward.setMaxStakedDego( amount);
    }
}